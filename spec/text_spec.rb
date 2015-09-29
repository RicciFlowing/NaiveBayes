require 'spec_helper'
require 'NaiveBayes'

describe Text do
  let(:text) do
    test_classifier = double('TestClassifier')
    Text.new(text: 'A test text', classifier: test_classifier)
  end

  it 'returns a list of words' do
    expect(text.words).to eq ['A', 'test', 'text']
  end

  it 'returns an empty array if no text is given' do
    test_classifier = double('TestClassifier')
    empty_text = Text.new(classifier: test_classifier)

    expect(empty_text.words).to eq []
  end

  it 'loads a file correctly' do
    test_classifier = double('TestClassifier')
    text = Text.new(
      path: 'spec/training/blender.txt',
      classifier: test_classifier)

    expect(text.words).to eq ['Blender']
  end
end
