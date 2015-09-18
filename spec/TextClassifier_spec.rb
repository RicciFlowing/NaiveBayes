require 'spec_helper'

describe NaiveBayes::TextClassifier do

  let(:classifier){NaiveBayes::TextClassifier.new('spec/training/')}

  it 'classifies a text correctly' do
    expect(classifier.classify(text: "Blender")).to be true
    expect(classifier.classify(text: "France")).to be false
  end

  it 'classifies a file correctly' do
    expect(classifier.classify(path: "spec/training/blender.txt")).to be true
  end
end
