require 'spec_helper'
require 'NaiveBayes'

describe TextClassifier do
  examples = PropabilityCalculator.new({path:'spec/training/'})
  let(:classifier){TextClassifier.new(examples )}

  it 'classifies a text correctly' do
    propabilities = double("propabilities", interesting: 0.5 ,not_interesting: 0.4 )
    allow(examples).to(receive(:get_propabilities_for){propabilities})

    expect(classifier.classify(["France"])).to eq true
  end

end
