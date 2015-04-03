require 'spec_helper'

describe UrlToImagePath do
  it 'has a version number' do
    expect(UrlToImagePath::VERSION).not_to be nil
  end

  it '#hello return hello world' do
    expect(UrlToImagePath.hello).to eq "Hello World"
  end

end
