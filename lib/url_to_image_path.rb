require "url_to_image_path/version"

module UrlToImagePath
  class Railtie < Rails::Railtie
    rake_tasks do 
      load '../tasks/convert_urls.rake'      
    end
  end
end
