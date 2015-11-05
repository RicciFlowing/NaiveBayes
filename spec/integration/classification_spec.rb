require 'spec_helper'
require 'NaiveText'

describe 'Classification' do

  context 'with trainingsdata as files' do
    let(:categories_config) do
       [{name: 'interesting', path: 'spec/training/positive'},
        {name: 'boring', path: 'spec/training/negative'}]
    end

    it 'classifies the given text correctly' do
      classifier = NaiveText.build(categories_config)
      expect { classifier.classify("test").name }
    end

    it 'returns a propability collection' do
      classifier = NaiveText.build(categories_config)
      expect(classifier.probabilities("test")).to be_instance_of(ProbabilityCollection)
    end
  end

  context 'with simple trainingsdata' do
    let(:categories_config) do
       [{name: 'interesting', path: 'spec/training2/positive'},
        {name: 'boring', path: 'spec/training2/negative'}]
    end

    let(:classifier) { NaiveText.build(categories_config) }

    it 'is case insensitve' do
      expect(classifier.classify("test").name).to eq classifier.classify("Test").name
    end

    it 'returns  not category for words that are not matched in the files' do
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
      puts classifier.propabilities("test ruby")
      expect(classifier.classify("test ruby").name).to eq "ruby"
    end
  end


  context 'with empty trainings file' do
    let(:empty_file) do
       [{name: 'empty', path: 'spec/training/with_empty_file'},
        {name: 'boring', path: 'spec/training/negative'}]
    end
    it 'warns the user' do
      expect(STDOUT).to receive(:puts).at_least(1)
      NaiveText.build(empty_file)
    end

    it 'classifies the given text without errors' do
      classifier = NaiveText.build(empty_file)
      expect(classifier.classify("test").name).to_not eq 'empty'
    end
  end
end
