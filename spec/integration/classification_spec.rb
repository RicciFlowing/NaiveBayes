require 'spec_helper'
require 'NaiveBayes'

describe 'Classification' do
  categories_config = [{name: 'interesting', path: 'spec/training/positive'},
                       {name: 'boring', path: 'spec/training/negative'}]

  categories = CategoriesFactory.build(categories_config)
  test_classifier = TextClassifier.new(categories: categories)

  context 'with text input' do
    let(:text1) { Text.new(text: 'Blender', classifier: test_classifier) }
    let(:text2) { Text.new(text: 'France', classifier:  test_classifier) }

    it 'classifies a text correctly' do
      expect(text1.classify.name).to eq 'interesting'
      expect(text2.classify.name).to eq 'boring'
    end
  end

  context 'with file input' do
    let(:text) do
      Text.new(path: 'spec/training/blender.txt', classifier: test_classifier)
    end

    it 'classifies a text correctly' do
      expect(text.classify.name).to eq 'interesting'
    end
  end
end
