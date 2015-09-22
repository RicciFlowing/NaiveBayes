require 'spec_helper'
require 'NaiveBayes'

describe "Classification" do

  context "with text input" do
    test_classifier = TextClassifier.new( TrainingExamples.new({path:'spec/training/'}))
    let(:text1){ Text.new({text:"Blender", classifier:test_classifier } ) }
    let(:text2) { Text.new({text: "France", classifier:  test_classifier})}

    it 'classifies a text correctly' do
      expect(text1.classify()).to be true
      expect(text2.classify()).to be false
    end
  end

  context "with file input" do
    test_classifier = TextClassifier.new( TrainingExamples.new({path:'spec/training/'}))
    let(:text){ Text.new({path:"spec/training/blender.txt", classifier:test_classifier } ) }


    it 'classifies a text correctly' do
      expect(text.classify()).to be true
    end
  end


end
