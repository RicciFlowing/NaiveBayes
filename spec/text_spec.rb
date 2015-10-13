require 'spec_helper'
require 'NaiveText'

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
end
