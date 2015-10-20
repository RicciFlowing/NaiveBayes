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
      expect(classifier.propabilities("test")).to be_instance_of(PropabilityCollection)
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

  end


  # Postponed Development for active record trainings data, as it will cause an breaking interface change
  #
  # context 'with trainingsdata as ActiveRecords' do
  #   let(:config) do
  #     {category_model: 'Category', name: 'name', texts: 'texts' }
  #   end
  #
  #   xit 'classifies the given text correctly' do
  #     classifier = NaiveText.build(config)
  #     expect(classifier.classify("test").name)
  #   end
  #
  #   xit 'returns a propability collection' do
  #     classifier = NaiveText.build(categories_config)
  #     expect(classifier.propabilities("test")).to be_instance_of(PropabilityCollection)
  #   end
  # end

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
