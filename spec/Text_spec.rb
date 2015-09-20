require 'spec_helper'
require 'NaiveBayes'


describe Text do
  test_classifier = TextClassifier.new( TrainingExamples.new({path:'spec/training/'}))
  let(:text){ Text.new({text:"A test text", classifier:test_classifier } ) }
  it 'returns a list of words' do
    expect(text.words).to eq ['A','test','text']
  end

  it 'returns an empty array if no text is given' do
    empty_text = Text.new({classifier:test_classifier })
    expect(empty_text.words).to eq []
  end

end
