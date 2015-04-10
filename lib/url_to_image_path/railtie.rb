require 'url_to_image_path'
require 'rails'

module MyPlugin
  class Railtie < Rails::Railtie
    railtie_name :url_to_image_path

    rake_tasks do
      Dir[File.join(File.dirname(__FILE__),'tasks/*.rake')].each { |f| load f }
    end
  end
end
