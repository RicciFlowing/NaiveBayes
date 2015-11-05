require 'spec_helper'
require 'NaiveText'

describe CategoriesFactory do
  context 'new syntax' do
    let(:example_test) { ExamplesFactory.from_files('spec/training2/negative') }
    let(:categories_config) do
       [{name: 'test', examples: example_test, weight: 2}]
    end

    it "build creates a Categories object" do
      categories = CategoriesFactory.build(categories: categories_config)
      expect(categories.first.name).to eq 'test'
      expect(categories.first.weight).to eq 2
    end
  end

  ## Should be removed soon
  context 'old syntax' do
    let(:categories_config) do
      [{name: 'interesting', path: 'spec/training/positive'},
       {name: 'boring', path: 'spec/training/negative'}]
    end

    it "build creates a Categories object" do
      categories = CategoriesFactory.build(categories_config)
      expect(categories.first.name).to eq 'interesting'
    end
  end
end
