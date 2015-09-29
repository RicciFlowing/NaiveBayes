require 'spec_helper'

describe PropabilityCalculator do
  let(:category_double) do
    double('category_double',
           id: 1,
           p: 0.01,
           word_count: 100)
  end

  let(:category_double2) do
    double('category_double2',
           id: 2,
           p: 0.03,
           word_count: 50)
  end
  let(:categories) do
    Categories.new(categories: [category_double, category_double2])
  end

  let(:calculator) { PropabilityCalculator.new(categories: categories) }

  describe 'get_propalities_for' do
    it 'returns a PropabilityCollection with correct_values' do
      propabilities = calculator.get_propabilities_for(['Word'])

      expect(propabilities.find(category_double)).to be_between(0.006, 0.007)
      expect(propabilities.find(category_double2)).to be_between(0.009, 0.012)
    end
  end
end
