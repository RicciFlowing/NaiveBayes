require 'spec_helper'

describe NaiveBayes do
  it 'has a version number' do
    expect(NaiveBayes::VERSION).not_to be nil
  end

  it 'has a TextClassifier class' do
    expect(NaiveBayes::TextClassifier).to respond_to(:new)
  end
end
