require 'spec_helper'

describe NaiveText do
  it 'has a version number' do
    expect(NaiveText::VERSION).not_to be nil
  end

  describe 'build' do
    it 'support the old categories_config syntax' do
      categories_config = [{ name: 'interesting', path: 'spec/training/positive' },
                           { name: 'boring', path: 'spec/training/negative' }]
      expect(CategoriesFactory).to receive(:build).with(categories_config)
      expect(TextClassifier).to receive(:new)
      expect(NaiveText.build(categories_config))
    end

    let(:examples1) { ExamplesFactory.from_files 'spec/training/positive' }
    let(:examples2) { ExamplesFactory.from_files 'spec/training/negative' }

    it 'supports the new categories_config syntax' do
      categories_config = { categories: [{ name: 'interesting', examples: examples1 },
                                         { name: 'boring', example: examples2 }] }
      expect(CategoriesFactory).to receive(:build).with(categories_config)
      expect(TextClassifier).to receive(:new)
      expect(NaiveText.build(categories_config))
    end
  end
end
