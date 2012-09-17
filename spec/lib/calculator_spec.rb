require_relative "../../lib/calculator.rb"

describe Calculator do

  context "Calculating mean" do
    it "returns nil when collection is empty" do
      Calculator.new.mean([]).should be_nil
    end
    it "returns same value when only one element" do
      Calculator.new.mean([7]).should eql(7.0)
    end
    it "returns the right mean value otherwise" do
      Calculator.new.mean([7, 13]).should eql(10.0)
    end
  end

  context "Calculating median" do
    it "returns nil when collection is empty" do
      Calculator.new.median([]).should be_nil
    end
    it "returns same value when only one element" do
      Calculator.new.median([7]).should eql(7.0)
    end
    it "returns the right median value for a collection with an odd elements count" do
      Calculator.new.median([50, 7, 13]).should eql(13.0)
    end
    it "returns the right median value for a collection with an even elements count" do
      Calculator.new.median([50, 7, 13, 22]).should eql( (22 + 13) / 2.0)
    end
  end

  context "Calculating mode" do
    it "returns nil when collection is empty" do
      Calculator.new.mode([]).should be_nil
    end
    it "returns same value when only one element" do
      Calculator.new.mode([7]).should eql([7])
    end
    it "returns the right mode value for a collection with a dominant value" do
      Calculator.new.mode([7, 7, 13]).should eql([7])
    end
    it "returns a collection of the most occurring items when there isnt a dominant one" do
      Calculator.new.mode([50, 50, 7, 13, 22, 7]).should eql( [7, 50])
    end
  end

end
