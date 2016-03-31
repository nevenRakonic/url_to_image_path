$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'url_to_image_path'
require 'pathname'

def file_setup
  @folder_path = Pathname.new("./temp")
  @file_path = @folder_path.join("test.css")  
  Dir.mkdir(@folder_path)
  FileUtils.touch(@file_path)
end

def teardown
  FileUtils.rm_rf(@folder_path)
end
