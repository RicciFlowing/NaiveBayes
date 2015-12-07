require 'spec_helper'
require 'NaiveText'

describe 'Classification' do
  context 'with empty trainings file' do
    let(:example_test) { ExamplesFactory.from_files('spec/training2/negative') }
    let(:empty) { ExamplesFactory.from_files('spec/training/with_empty_file/empty') }
    let(:categories_config) do
       [{name: 'test', examples: example_test},
        {name: 'empty', examples: empty}]
    end
    let(:classifier) { NaiveText.build(categories: categories_config) }

    it 'warns the user' do
      expect(STDOUT).to receive(:puts).at_least(1)
      ExamplesFactory.from_files('spec/training/with_empty_file/empty')
    end

    it 'classifies the given text without errors' do
      expect(classifier.classify("test").name).to_not eq 'empty'
    end
  end
end
