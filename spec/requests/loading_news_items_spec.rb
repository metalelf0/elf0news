require 'spec_helper'

describe 'News Items Lookup from HN' do
  it "shows some news items" do
    VCR.use_cassette 'hacker_news' do
      visit root_path
      click_link 'Lookup from HackerNews'
      page.should have_content("Android can be beautiful")
    end
  end

  it "displays an alert when HN API cannot be reached" do
    stubs = Faraday::Adapter::Test::Stubs.new do |stub|
      stub.get('http://api.ihackernews.com/page') { [500, {}, 'error'] }
    end

    visit root_path
    click_link 'Lookup from HackerNews'
    page.should have_content("Unable to update news items, try again later.")
  end
end
