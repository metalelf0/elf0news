require "spec_helper"

describe LinksMailer do
  describe "top_links" do

    before :each do
      VCR.use_cassette 'hacker_news' do
        client = Clients::HackerNews.new
        updated_items = NewsItemFactory.new.create_from(client.data)
        updated_items.should_not eql(0)
      end
    end

    let(:mail)   { LinksMailer.top_links("to@example.org") }

    it "renders the headers" do
      mail.subject.should eq("Top links")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["only_the_best@links.com"])
    end

    it "includes the stats" do
      mail.body.should =~ /Mean:(\s)+99.13/
    end

  end

end
