require 'spec_helper'
require 'NaiveText'

describe 'Classification' do

  context 'with trainingsdata as files' do
    let(:examples1) { ExamplesFactory.from_files('spec/training/positive') }
    let(:examples2) { ExamplesFactory.from_files('spec/training/negative') }
    let(:categories_config) do
       [{name: 'interesting', examples: examples1},
        {name: 'boring', examples: examples2}]
    end

    let(:classifier) { NaiveText.build(categories: categories_config) }
    it 'classifies the given text correctly' do
      expect(classifier.classify("blender").name).to eq "interesting"
      expect(classifier.classify("trinity").name).to eq "boring"
    end

  end

  context 'with simple trainingsdata' do
    let(:examples1) { ExamplesFactory.from_files('spec/training2/positive') }
    let(:examples2) { ExamplesFactory.from_files('spec/training2/negative') }
    let(:categories_config) do
       [{name: 'interesting', examples: examples1},
        {name: 'boring', examples: examples2}]
    end

    let(:classifier) { NaiveText.build(categories: categories_config) }

    it 'returns a propability collection' do
      expect(classifier.probabilities("test")).to be_instance_of(ProbabilityCollection)
    end

    it 'is case insensitve' do
      expect(classifier.classify("test").name).to eq classifier.classify("Test").name
    end

    it 'returns  no category for words that are not matched in the files' do
      puts classifier.probabilities("This words aren't in the files")
      expect(classifier.classify("This words aren't in the files").name).to eq "No category"
    end
  end

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
