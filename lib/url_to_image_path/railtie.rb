require 'url_to_image_path'
require 'rails'

module MyPlugin
  class Railtie < Rails::Railtie
    railtie_name :url_to_image_path

    rake_tasks do
      require_relative "../../tasks/convert_urls"
    end
  end
end
