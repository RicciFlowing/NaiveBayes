require 'spec_helper'
require 'NaiveBayes'

describe TextClassifier do
  let(:category_double){double("category_double", {:id => 1} ) }
  let(:category_double2){double("category_double2", {:id => 2} ) }
  let(:categories){  Categories.new({categories: [category_double, category_double2]})}
  let(:propabilities){ PropabilityCollection.new(categories: categories)}
  let(:calculator_double){ double("calculator")}

  let(:classifier){
    TextClassifier.new( categories: categories,  calculator: calculator_double )
    }

  it 'gets the right category for a list of words' do
    propabilities.set(category: category_double, value: 0.5)
    propabilities.set(category: category_double2, value: 0.7)
    allow(calculator_double).to(receive(:get_propabilities_for){propabilities})

    expect(classifier.get_category_for(["France"]).id).to eq category_double2.id
  end

end
