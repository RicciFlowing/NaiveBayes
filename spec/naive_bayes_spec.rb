require 'spec_helper'

describe NaiveBayes do
  it 'has a version number' do
    expect(NaiveBayes::VERSION).not_to be nil
  end

  it 'throws an exception if no classifier is present ' do
    expect { NaiveBayes.classify("Blender") }.to output.to_stdout
  end

  it 'responds to build' do
    categories_config = [{name: 'interesting', path: 'spec/training/positive'},
                         {name: 'boring', path: 'spec/training/negative'}]
    expect(CategoriesFactory).to receive(:build).with(categories_config)
    expect(TextClassifier).to receive(:new)
    expect(NaiveBayes.build(categories_config))
  end

  it 'classifies a string and returns a category ' do
    categories_config = [{name: 'interesting', path: 'spec/training/positive'},
                         {name: 'boring', path: 'spec/training/negative'}]
    NaiveBayes.build(categories_config)

    expect(NaiveBayes.classify("Blender").name).to eq 'interesting'
    expect(NaiveBayes.classify("France").name).to eq 'boring'
  end



end
