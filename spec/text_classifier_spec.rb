require 'spec_helper'
require 'NaiveText'

describe TextClassifier do
  let(:category) { double('category_double', id: 1) }
  let(:category2) { double('category_double2', id: 2) }
  let(:categories) { Categories.new(categories: [category, category2]) }
  let(:propabilities) { PropabilityCollection.new(categories: categories) }
  let(:calculator) { double('calculator') }

  let(:classifier) do
    TextClassifier.new(categories: categories, calculator: calculator)
  end

  it 'classifies a text and returns a category' do
    propabilities.set(category: category, value: 0.5)
    propabilities.set(category: category2, value: 0.7)
    allow(calculator).to(receive(:get_propabilities_for) { propabilities })

    expect(classifier.classify("France").id).to eq category2.id
  end
end
