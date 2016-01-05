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
end
