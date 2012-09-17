require 'spec_helper'

describe NewsItemFactory do

    let(:sample_data) { {"items"=> [
      {"title"=>"Introducing the Command Bar",
       "url"=>"https://github.com/blog/1264-introducing-the-command-bar",
       "id"=>4534549,
       "commentCount"=>7,
       "points"=>50,
       "postedAgo"=>"28 minutes ago",
       "postedBy"=>"dko"}
    ] }}

    it "builds a valid object from sample data" do
      Proc.new { NewsItemFactory.new.create_from(sample_data) }.should change(NewsItem, :count).by(1)
    end

    it "updates an existing object" do
      NewsItem.create(:original_id => 4534549, :title => "Old title", :score => 0, :url => "An old url")
      Proc.new { NewsItemFactory.new.create_from(sample_data) }.should_not change(NewsItem, :count)
      NewsItem.first.title.should == "Introducing the Command Bar"
    end

end

