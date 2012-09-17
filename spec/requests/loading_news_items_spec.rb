require 'spec_helper'

describe 'News Items Lookup from HN' do
  it "shows some news items" do
    VCR.use_cassette 'hacker_news' do
      visit root_path
      click_link 'Lookup from HackerNews'
      page.should have_content("Android can be beautiful")
    end
  end
end
