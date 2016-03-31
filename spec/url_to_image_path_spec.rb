require 'spec_helper'
require 'rake'

describe UrlToImagePath do
  let (:rake_invoke) do
    Rake::Task.define_task(:environment)
    Rake::Task["url:to_image_path"].invoke("test.css")
    Rake::Task["url:to_image_path"].reenable
  end

  it 'has a version number' do
    expect(UrlToImagePath::VERSION).not_to be nil
  end

  describe "urlify task" do
    before do
      load File.expand_path("../../tasks/convert_urls.rb", __FILE__)
      file_setup
    end

    after do
      teardown
    end

    it "creates a new scss file in the same folder as original file" do
      rake_invoke
      @result_path = @folder_path.join("test.css.scss")
      expect(File.file? @result_path).to eq true
    end

    it "doesn't change css without image urls" do
      css = %Q[
                .foo {
                  width: 55px;
                }

                li {
                  display: inline-block;
                }
              ]
      IO.write(@file_path, css)
      rake_invoke

      expect(File.read(@folder_path.join("test.css.scss"))).to eq css
    end

    it "changes css with image urls" do
      css = %Q[
      .foo {
        width: 55px;
        background-image: url('images/header-background.jpg');
      }

      li {
        display: inline-block;
      }]

      expected_css = %Q[
      .foo {
        width: 55px;
        background-image: url(image_path("header-background.jpg"));
      }

      li {
        display: inline-block;
      }]

      IO.write(@file_path, css)
      rake_invoke

      expect(File.read(@folder_path.join("test.css.scss"))).to eq expected_css
    end

    it "changes css with image urls" do
      css = %Q[
      .foo {
        width: 55px;
        background-image: url('images/header-background.JPG');
      }

      li {
        display: inline-block;
      }]

      expected_css = %Q[
      .foo {
        width: 55px;
        background-image: url(image_path("header-background.JPG"));
      }

      li {
        display: inline-block;
      }]

      IO.write(@file_path, css)
      rake_invoke

      expect(File.read(@folder_path.join("test.css.scss"))).to eq expected_css
    end
  end

end
