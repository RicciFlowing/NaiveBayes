require 'spec_helper'
require 'NaiveText'

describe TextClassifier do
  let(:category) { double('category_double', id: 1, weight: 2) }
  let(:category2) { double('category_double2', id: 2, weight: 1) }
  let(:categories) { Categories.new(categories: [category, category2]) }
  let(:probabilities) { ProbabilityCollection.new(categories: categories) }
  let(:calculator) { double('calculator') }

  let(:classifier) do
    TextClassifier.new(categories: categories, calculator: calculator)
  end

  it 'classifies a text and returns a category' do
    probabilities.set(category: category, value: 0.25)
    probabilities.set(category: category2, value: 0.49)
    allow(calculator).to(receive(:get_probabilities_for) { probabilities })

    expect(classifier.classify("France").id).to eq category.id
  end
end
