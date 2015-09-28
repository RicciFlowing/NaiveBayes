require 'spec_helper'
require 'NaiveBayes'

describe "Classification" do
  interesting = Category.new(name: interesting, examples: ExamplesGroup.new("spec/training/positive"))
  boring = Category.new(name: boring, examples: ExamplesGroup.new("spec/training/negative"))
  categories = Categories.new(categories:[interesting, boring])
  test_classifier = TextClassifier.new(categories: categories)

  context "with text input" do

    let(:text1){ Text.new({text:"Blender", classifier: test_classifier } ) }
    let(:text2) { Text.new({text: "France", classifier:  test_classifier})}

    it 'classifies a text correctly' do
      expect(text1.classify()).to be interesting
      expect(text2.classify()).to be boring
    end
  end

  context "with file input" do
    let(:text){ Text.new({path:"spec/training/blender.txt", classifier:test_classifier } ) }


    it 'classifies a text correctly' do
      expect(text.classify()).to be interesting
    end
  end


end
