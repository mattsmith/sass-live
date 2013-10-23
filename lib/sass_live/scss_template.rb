module SassLive
  class ScssTemplate
    
    # logical_path = 'app/assets/stylesheets/custom.css.scss.erb'
    # environment = ::YourApp::Application.assets
    def initialize(logical_path, environment)
      @logical_path = logical_path
      @environment = environment
    end
    
    def render(data={})
      path = ::Rails.root.join(logical_path)
      
      context = environment.context_class.new(environment, logical_path, Pathname.new(path))
    
      # TODO Change to Tilt.templates_for(file) in Tilt 2.x
      templates = [Tilt::ERBTemplate, Sass::Rails::ScssTemplate]
    
      css = templates.inject(nil) do |data, template|
        blk = proc { data } if data
        template.new(path.to_s, &blk).render(context, data)
      end
    end
  end
end
