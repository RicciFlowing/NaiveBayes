require 'spec_helper'

describe PropabilityCalculator do
  let(:category_double){double("category_double", :id => 1, :p => 0.01, :word_count => 100 ) }
  let(:category_double2){double("category_double2", :id => 2, :p => 0.03, :word_count => 50 ) }
  let(:categories){  Categories.new(categories: [category_double, category_double2])}

  let(:calculator){  PropabilityCalculator.new(categories: categories)  }

  describe 'get_propalities_for' do
    it 'returns a PropabilityCollection with correct_values' do
      propabilities = calculator.get_propabilities_for(["Word"])
      expect(propabilities.find(category_double)).to be_between(0.6*0.01, 0.7*0.01)
      expect(propabilities.find(category_double2)).to be_between(0.3*0.03, 0.4*0.03)
    end
  end


end
