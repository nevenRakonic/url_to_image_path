require 'spec_helper'
require 'rake'

describe UrlToImagePath do
  it 'has a version number' do
    expect(UrlToImagePath::VERSION).not_to be nil
  end

  describe "urlify task" do
    before do
      load File.expand_path("../../tasks/convert_urls.rb", __FILE__)
      Rake::Task.define_task(:environment)
      setup
      Rake::Task["url:urlify"].invoke("test.css")
    end

    after do
      teardown
    end

    it "creates a new scss file in the same folder as original file" do      
      @result_path = @folder_path.join("test.css.scss")
      expect(File.file? @result_path).to eq true
    end
  end

end
