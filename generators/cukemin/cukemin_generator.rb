class CukeminGenerator < Rails::Generator::NamedBase
  
  attr_accessor :name, :attributes, :controller_actions
  
  def initialize(runtime_args, runtime_options = {})
    super
    usage if @args.empty?
    
    @name = @args.first
    @controller_actions = []
    @attributes = []
    @args[0..-1].each do |arg|
      if arg == '!'
        options[:invert] = true
      elsif arg.include? ':'
        @attributes << Rails::Generator::GeneratedAttribute.new(*arg.split(":"))
      else
        @controller_actions << arg
        @controller_actions << 'create' if arg == 'new'
        @controller_actions << 'update' if arg == 'edit'
      end
    end
    
    @controller_actions.uniq!
    @attributes.uniq!
    
    if options[:invert] || @controller_actions.empty?
      @controller_actions = all_actions - @controller_actions
    end
    
    if @attributes.empty?
      options[:skip_model] = true # default to skipping model if no attributes passed
      if model_exists?
        model_columns_for_attributes.each do |column|
          @attributes << Rails::Generator::GeneratedAttribute.new(column.name.to_s, column.type.to_s)
        end
      else
        @attributes << Rails::Generator::GeneratedAttribute.new('name', 'string')
      end
    end
  end
  
  def manifest
    record do |m|
      # puts "#{module_name}, #{model_name}, #{class_name}, #{file_name}, #{file_path}"
      # debugger
      m.class_collisions class_name, "#{class_name}Controller"
      
      m.directory controller_dir
      m.template "controller.rb", "#{controller_dir}/#{plural_name}_controller.rb"
      
      m.directory view_dir
      m.template "views/index.html.erb", "#{view_dir}/index.html.erb"
      m.template "views/new.html.erb", "#{view_dir}/new.html.erb"
      m.template "views/edit.html.erb", "#{view_dir}/edit.html.erb"
      m.template "views/_form.html.erb", "#{view_dir}/_form.html.erb"
      
      m.directory 'features'
      m.template 'feature.feature', "features/#{plural_path_helper}.feature"
    end
  end
  
  def split_class_name
    class_name.split('::')
  end
  
  def module_parts
    split_class_name[0,split_class_name.length - 1]
  end
  
  def module_name
    module_parts.join('::')
  end
  
  def form_object
    if module_parts.empty?
      "@#{singular_name}" 
    else
      "[#{module_parts.map{ |p| ':' + p.downcase }.join(',')}, @#{singular_name}]"
    end
  end
  
  def model_name
    class_name.split('::').last
  end
  
  def controller_dir
    "app/controllers/#{File.dirname(file_path)}"
  end
  
  def view_dir
    "app/views/#{File.dirname(file_path)}/#{plural_name}"
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
  
  def all_actions
    %w[index show new create edit update destroy]
  end

  def after_generate
    puts "

Generated!

"
  end
end