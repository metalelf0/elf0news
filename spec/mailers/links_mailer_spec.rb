require "spec_helper"

describe LinksMailer do
  describe "top_links" do
    let(:mail) { LinksMailer.top_links("to@example.org") }

    it "renders the headers" do
      mail.subject.should eq("Top links")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["only_the_best@links.com"])
    end

  end

end
