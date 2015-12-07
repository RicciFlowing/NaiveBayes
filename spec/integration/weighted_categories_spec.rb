require 'spec_helper'
require 'NaiveText'

describe 'Classification' do
  context 'with weighted categories' do
    let(:example_test) { ExamplesFactory.from_files('spec/training2/negative') }
    let(:example_ruby) { ExamplesFactory.from_files('spec/training2/positive') }
    let(:categories_config) do
       [{name: 'test', examples: example_test, weight: 1},
        {name: 'ruby', examples: example_ruby, weight: 4}]
    end

    let(:classifier) { NaiveText.build(categories: categories_config) }

    it 'classifies correctly' do
      expect(classifier.classify("test ruby").name).to eq "ruby"
    end
  end

end
