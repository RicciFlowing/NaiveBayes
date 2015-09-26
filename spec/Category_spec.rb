require 'spec_helper'

describe Category do
  let(:category){
    examples_double =  double("examples", :count => 1 )
    Category.new({name: "test", examples: examples_double})
    }
  describe "examples" do
    it "returns a ExamplesGroup" do
      expect(category.examples)
    end
  end

  describe "name" do
    it "returns its name" do
      expect(category.name).to eq "test"
    end
  end

end
