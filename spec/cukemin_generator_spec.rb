require 'spec_helper'
require 'rails_generator'
require 'rails_generator/scripts/generate'

describe CukeminGenerator do
  
  before do
    Rails::Generator::Scripts::Generate.new.run(["cukemin", 'admin/place'], :destination => fake_rails_root, :backtrace => true)
  end
  
  let(:controller_file) { fake_rails_root + '/app/controllers/admin/places_controller.rb' }
  
  it "should create the controller file" do
    File.exists?(controller_file).should be_true
  end
  
  it "should make things really really nice" do
    output = File.read(controller_file)
    output.should match(/Admin::PlacesController < ApplicationController/)
    output.should match(/@place = Place.new/)
    output.should match(/@place = Place.new\(params\[\:place\]\)/)
    output.should match(/if @place.save/)
    output.should match(/redirect_to admin_places_path/)
    output.should match(/@place = Place.find\(params\[:id\]\)/)
    output.should match(/if @place.update_attributes\(params\[:place\]\)/)
    output.should match(/@place.destroy/)
  end
  
  after do
    FileUtils.rm_r(fake_rails_root)
  end
  
  
  def fake_rails_root
    File.join(File.dirname(__FILE__), 'spec', 'rails_root')
  end

  def file_list(dir)
    Dir.glob(File.join(dir, "*"))
  end
  
end