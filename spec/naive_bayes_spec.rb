require 'spec_helper'

describe NaiveText do
  it 'has a version number' do
    expect(NaiveText::VERSION).not_to be nil
  end

  it 'throws an exception if no classifier is present ' do
    expect { NaiveText.classify("Blender") }.to output.to_stdout
  end

  it 'responds to build' do
    categories_config = [{name: 'interesting', path: 'spec/training/positive'},
                         {name: 'boring', path: 'spec/training/negative'}]
    expect(CategoriesFactory).to receive(:build).with(categories_config)
    expect(TextClassifier).to receive(:new)
    expect(NaiveText.build(categories_config))
  end

  it 'classifies a string and returns a category ' do
    categories_config = [{name: 'interesting', path: 'spec/training/positive'},
                         {name: 'boring', path: 'spec/training/negative'}]
    NaiveText.build(categories_config)

    expect(NaiveText.classify("Blender").name).to eq 'interesting'
    expect(NaiveText.classify("France").name).to eq 'boring'
  end



end
