require 'spec_helper'

describe ProbabilityCalculator do
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

  let(:calculator) { ProbabilityCalculator.new(categories: categories) }

  describe 'get_propalities_for' do
    it 'returns a ProbabilityCollection with correct_values' do
      probabilities = calculator.get_probabilities_for('Word')
      expect(probabilities.sum).to be_between(0.999, 1.001)
      expect(probabilities.find(category_double)).to be_between(0.399, 0.401)
      expect(probabilities.find(category_double2)).to be_between(0.599, 0.601)
    end
  end
end
