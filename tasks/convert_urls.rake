require 'rake'
require 'tempfile'

desc "receives a css file and returns an scss file with url links changed to 
      asset pipeline helpers"

namespace :url do
  task :urlify, [:filename] do |title, args|
    file_name = args[:filename]
    assets_path = Rails.root.join('app/assets/stylesheets/') 

    # looks for either end of parenthesis and the slash sign
    split_pattern = /[\(\)\/]/
    image_extension = /(\.png)|(\.jpg)|(\.gif)/

    #we create a temporary file
    tmp = Tempfile.new("tmp")

    css = File.open(assets_path + file_name, "r+")
    css.each do |line|
      # find lines with css url property
      if /url/.match(line)
        matches = line.split(split_pattern)
        matches.each do |part|
          # extract art of the line that contains image name with extension
          if image_extension.match(part)
            part.gsub!(/[^0-9a-z_\-\.]/i, '')
            line.gsub!(/url\(.*\)/, "url(image_path(\"#{part}\"))")        
          end
        end
      end
      tmp << line
    end

    tmp.close
    css.close

    # we move the temporary file to the assets directory
    mv(tmp.path, assets_path.join(file_name + ".scss"))
  end
end
