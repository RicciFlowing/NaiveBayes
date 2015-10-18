require 'spec_helper'
require 'NaiveText'

describe 'Classification' do
  let(:categories_config) do
     [{name: 'interesting', path: 'spec/training/positive'},
      {name: 'boring', path: 'spec/training/negative'}]
  end

  let(:empty_file) do
     [{name: 'empty', path: 'spec/training/with_empty_file'},
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

  context 'with empty trainings file' do
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
