require 'spec_helper'

describe Category do
  let(:category){
    examples_double =  double("examples", :count => 1, :word_count => 10 )
    Category.new({name: "test", examples: examples_double})
    }

  describe "p" do
    it "returns the frequency of a word in the examples" do
      expect(category.p("test")).to eq 0.1
    end
  end

  describe "word_count" do
    it "returns the number of words in the examples" do
      expect(category.word_count).to eq 10
    end
  end

  describe "name" do
    it "returns its name" do
      expect(category.name).to eq "test"
    end
  end

end
