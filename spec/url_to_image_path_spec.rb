require 'spec_helper'
require 'rake'

describe UrlToImagePath do
  it 'has a version number' do
    expect(UrlToImagePath::VERSION).not_to be nil
  end

  describe "rake task test" do
    before do
      load File.expand_path("../../tasks/convert_urls.rb", __FILE__)
      Rake::Task.define_task(:environment)
    end

    it ":foo returns foo" do
      # expect(Foo).to receive :bar
      # Rake::Task["url:foo"].invoke
      # Rake::Task["url:foo"].reenable
      # expect(Rake::Task["url:foo"].invoke).to eq "foo"
    end
  end

end
