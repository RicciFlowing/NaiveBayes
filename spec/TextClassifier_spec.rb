require 'spec_helper'
require 'NaiveBayes'

describe TextClassifier do

  let(:classifier_blender){TextClassifier.new( TrainingExamples.new({path:'spec/training/'}))}

  it 'classifies a text correctly' do
    expect(classifier_blender.classify(["Blender"])).to be true
    expect(classifier_blender.classify(["France"])).to be false
  end

end
