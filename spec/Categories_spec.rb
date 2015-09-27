require 'spec_helper'

describe Categories do
  let(:category_double){double("category_double", :id => 1, :p => 0.01, :word_count => 100 ) }
  let(:category_double2){double("category_double2", :id => 2, :p => 0.03, :word_count => 50 ) }
  let(:categories){  Categories.new([category_double, category_double2])}

  describe "p_apriori" do
    it "returns the apriori propability for a word to be in a category" do
      expect(categories.p_apriori(category_double)).to be_between(0.66,0.67)
    end
  end

end
