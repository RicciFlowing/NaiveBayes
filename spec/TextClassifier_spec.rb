require 'spec_helper'

describe NaiveBayes::TextClassifier do

  let(:classifier_blender){NaiveBayes::TextClassifier.new( Text.new(text: "Blender"), TrainingExamples.new('spec/training/'))}
  let(:classifier_france){NaiveBayes::TextClassifier.new( Text.new(text: "France"), TrainingExamples.new('spec/training/'))}
  let(:classifier_blender_file){NaiveBayes::TextClassifier.new( Text.new(path: "spec/training/blender.txt"), TrainingExamples.new('spec/training/'))}

  it 'classifies a text correctly' do
    expect(classifier_blender.classify()).to be true
    expect(classifier_france.classify()).to be false
  end

  it 'classifies a file correctly' do
    expect(classifier_blender_file.classify()).to be true
  end
end
