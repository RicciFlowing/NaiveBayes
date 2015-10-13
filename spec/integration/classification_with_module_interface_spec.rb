require 'spec_helper'
require 'NaiveText'

describe 'Classification' do
  let(:categories_config) do
     [{name: 'interesting', path: 'spec/training/positive'},
      {name: 'boring', path: 'spec/training/negative'}]
  end

  it 'classifies the given text correctly' do
    classifier = NaiveText.build(categories_config)
    expect { classifier.classify("test") }
  end

  it 'classifies a text not mentioned as no_category' do
    classifier = NaiveText.build(categories_config)
    expect(classifier.classify("abc").name).to eq  "No Category"
  end


end
