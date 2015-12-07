require 'spec_helper'
require 'NaiveText'

describe 'Classification' do
    let(:examples1) { ExamplesFactory.from_files('spec/training2/positive') }
    let(:examples2) { ExamplesFactory.from_files('spec/training2/negative') }
    let(:categories_config) do
       [{name: 'interesting', examples: examples1},
        {name: 'boring', examples: examples2}]
    end
    let(:classifier) { NaiveText.build(categories: categories_config) }

  context 'For texts that do not intersect with the trainingsdata' do
      it 'returns a NullCategory if not default is set' do
        expect(classifier.classify("This words aren't in the files").name).to eq "No category"
      end

      it 'returns the default category if one is set' do
        classifier = NaiveText.build(categories: categories_config, default: 'interesting')
        expect(classifier.classify("This words aren't in the files").name).to eq "interesting"
      end
  end
end
