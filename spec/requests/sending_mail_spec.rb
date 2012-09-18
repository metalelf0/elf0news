require 'spec_helper'

describe 'Sending mail with top items' do

  before :each do
    VCR.use_cassette 'hacker_news' do
      visit root_path
      click_link 'Lookup from HackerNews'
      page.should have_content("Android can be beautiful")
    end
  end

  it "sends no email when no address provided" do
    visit root_path
    click_button 'Send top links'
    page.should have_content("You must provide an email address.")
  end

  it "sends no email when invalid address provided" do
    visit root_path
    fill_in "Enter email:", :with => "nope@.com"
    click_button 'Send top links'
    page.should have_content("You must provide a valid email address.")
  end

  it "sends email when valid address provided" do
    visit root_path
    fill_in "Enter email:", :with => "try_this@mailinator.com"
    click_button 'Send top links'
    page.should have_content("Email delivered. Check your inbox!")
  end

end
