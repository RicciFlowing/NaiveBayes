require 'spec_helper'

describe NaiveText do
  it 'has a version number' do
    expect(NaiveText::VERSION).not_to be nil
  end

  it 'responds to build' do
    categories_config = [{name: 'interesting', path: 'spec/training/positive'},
                         {name: 'boring', path: 'spec/training/negative'}]
    expect(CategoriesFactory).to receive(:build).with(categories_config)
    expect(TextClassifier).to receive(:new)
    expect(NaiveText.build(categories_config))
  end
end
