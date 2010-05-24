class CukeminGenerator < Rails::Generator::NamedBase
  def manifest
    record do |m|
      # puts "#{module_name}, #{model_name}, #{class_name}, #{file_name}, #{file_path}"
      # debugger
      m.class_collisions class_name, "#{class_name}Controller"
      
      m.directory controller_dir
      m.template "controller.rb", "#{controller_dir}/#{plural_name}_controller.rb"
    end
  end
  
  def module_name
    parts = class_name.split('::')
    parts.pop
    parts.join('::')
  end
  
  def model_name
    class_name.split('::').last
  end
  
  def controller_dir
    "app/controllers/#{File.dirname(file_path)}"
  end
  
  def plural_class_name
    "#{module_name}::#{plural_name.camelize}"
  end
  
  def singular_path_helper
    file_path.gsub('/', '_')
  end
  
  def plural_path_helper
    "#{File.dirname(file_path).gsub('/', '_')}_#{plural_name}"
  end

  def after_generate
    puts "

Generated!

"
  end
end