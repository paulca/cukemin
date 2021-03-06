require 'spec_helper'
require 'rails_generator'
require 'rails_generator/scripts/generate'

describe CukeminGenerator do
  
  before do
    Rails::Generator::Scripts::Generate.new.run(["cukemin", 'admin/place', 'name:string', 'description:text'], :destination => fake_rails_root, :backtrace => true)
  end
  
  let(:controller_file) { fake_rails_root + '/app/controllers/admin/places_controller.rb' }
  let(:index_view_file) { fake_rails_root + '/app/views/admin/places/index.html.erb' }
  let(:edit_view_file) { fake_rails_root + '/app/views/admin/places/edit.html.erb' }
  let(:new_view_file) { fake_rails_root + '/app/views/admin/places/new.html.erb' }
  let(:form_view_file) { fake_rails_root + '/app/views/admin/places/_form.html.erb' }
  let(:feature_file) { fake_rails_root + '/features/admin_places.feature' }
  
  it "should create the controller file" do
    File.exists?(controller_file).should be_true
  end
  
  it "should output the controller" do
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
  
  it "should create the index view file" do
    File.exists?(index_view_file).should be_true
  end
  
  it "should output the index view" do
    output = File.read(index_view_file)
    output.should match(/Places/)
    output.should include(%Q[<li><%= link_to 'Add New Place', new_admin_place_path %></li>])
    output.should match(/if @places.empty?/)
    output.should match(/No places found./)
    output.should match(/@places.each do |place|/)
    output.should match(/place.name/)
    output.should match(/link_to "Edit", edit_admin_place_path\(place\)/)
    output.should include(%Q[link_to "Delete", admin_place_path(place), :method => :delete, :confirm => 'Are you sure?'])
    output.should include("will_paginate(@places)")
  end
  
  it "should create the new view file" do
    File.exists?(new_view_file).should be_true
  end
  
  it "should output the new view" do
    output = File.read(new_view_file)
    output.should include("New Place")
  end

  it "should create the edit view file" do
    File.exists?(edit_view_file).should be_true
  end
  
  it "should output the new view" do
    output = File.read(edit_view_file)
    output.should include("Edit Place")
  end
  
  it "should create the form partial file" do
    File.exists?(form_view_file).should be_true
  end
  
  it "should output the form partial" do
    output = File.read(form_view_file)
    output.should include(%Q[<%- form_for([:admin, @place]) do |f| -%>])
    output.should include(%Q[<%= f.label :name %> <%= f.text_field :name %> <br />])
    output.should include(%Q[<%= f.submit "Save" %> or <%= link_to "Cancel", admin_places_path %>])
  end
  
  it "should create the feature file" do
    File.exists?(feature_file).should be_true
  end
  
  it "should output the feature file" do
    output = File.read(feature_file)
    output.should include(%Q[Feature: Managing Places])
    output.should include(%Q[Scenario: Creating a new place])
    output.should include(%Q[When I follow "Places"])
    output.should include(%Q[And I follow "Add New Place"])
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