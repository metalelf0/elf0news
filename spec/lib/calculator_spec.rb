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


end
