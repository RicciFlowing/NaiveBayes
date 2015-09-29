require 'spec_helper'
require 'NaiveBayes'

describe CategoriesFactory do
  let(:categories_config) do
    [{name: 'interesting', path: 'spec/training/positive'},
     {name: 'boring', path: 'spec/training/negative'}]
  end

  it "build creates a Categories object" do
    categories = CategoriesFactory.build(categories_config)
    expect(categories.first.name).to eq 'interesting'
    expect(categories.p_apriori(categories.first)).to be_between(0, 1)
  end
end
