require 'spec_helper'
require 'NaiveText'

describe 'Classification' do
  let(:examples1) { ExamplesFactory.from_files('spec/training2/positive') }
  let(:examples2) { ExamplesFactory.from_files('spec/training2/negative') }
  let(:categories_config) do
    [{ name: 'interesting', examples: examples1 },
     { name: 'boring', examples: examples2 }]
  end
  let(:language_model) do
    lambda do |str|
      if str == 'testing'
        str = 'test'
      else
        str
      end
    end
  end
  let(:classifier) { NaiveText.build(categories: categories_config, language_model: language_model) }

  it 'returns the correct category' do
    expect(classifier.classify('testing').name).to eq 'boring'
  end
end
