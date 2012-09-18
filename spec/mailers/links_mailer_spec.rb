require "spec_helper"

describe LinksMailer do
  describe "top_links" do
    let(:mail) { LinksMailer.top_links }

    it "renders the headers" do
      mail.subject.should eq("Top links")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
