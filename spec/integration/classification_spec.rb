require 'spec_helper'
require 'NaiveText'

describe 'Classification' do
  let(:examples1) { ExamplesFactory.from_files('spec/training2/positive') }
  let(:examples2) { ExamplesFactory.from_files('spec/training2/negative') }

  let(:categories_config) do
    [{ name: 'interesting', examples: examples1 },
     { name: 'boring', examples: examples2 }]
  end
  let(:classifier) { NaiveText.build(categories: categories_config) }

  context 'with normal input' do
    it 'returns the category' do
      expect(classifier.classify('ruby').name).to eq 'interesting'
    end
  end

  context 'with more than one file and longer texts' do
    let(:long_text_examples) { ExamplesFactory.from_files('spec/training/long') }
    let(:many_files_examples) { ExamplesFactory.from_files('spec/training/many_files') }
    let(:categories_config) do
      [{ name: 'long', examples: long_text_examples },
       { name: 'many', examples: many_files_examples }]
    end

    it 'builds a classifier' do
      expect(NaiveText.build(categories: categories_config))
    end
  end

  context 'with input not intersecting the trainingsdata' do
    it 'returns a NullCategory if not default is set' do
      expect(classifier.classify("This words aren't in the files").name).to eq 'No category'
    end

    it 'returns the default category if one is set' do
      classifier = NaiveText.build(categories: categories_config, default: 'interesting')
      expect(classifier.classify("This words aren't in the files").name).to eq 'interesting'
    end
  end

  context 'with empty trainings file' do
    let(:empty_examples) { ExamplesFactory.from_files('spec/training2/with_empty_file/empty') }
    let(:config_with_empty_examples) do
      [{ name: 'test', examples: examples2 },
       { name: 'empty', examples: empty_examples }]
    end
    let(:classifier) { NaiveText.build(categories: config_with_empty_examples) }

    it 'warns the user' do
      expect(STDOUT).to receive(:puts).at_least(1)
      ExamplesFactory.from_files('spec/training/with_empty_file/empty')
    end

    it 'classifies the given text without errors' do
      expect(classifier.classify('test').name).to_not eq 'empty'
    end
  end
end
