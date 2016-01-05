require 'spec_helper'

describe ExamplesGroup do
  let(:example) { double('example', text: 'Blender') }
  let(:group) { ExamplesGroup.new(examples: [example]) }

  describe 'count' do
    it 'returns a positive value for a word in a interesting text' do
      expect(group.count('Blender')).to be > 0
    end

    it 'returns zero for a word not contained in all interesting texts' do
      expect(group.count('Lorem')).to be 0
    end
  end

  describe 'Word_count' do
    it 'returns a positive number' do
      expect(group.word_count).to be > 0
    end
  end

  context 'with language model' do
    let(:example2) { double('example', text: 'tests') }
    let(:lang_model) do
      lambda do |str|
        if %w(testing tests).find(str)
          'test'
        else
          str
        end
      end
    end
    let(:group2) { ExamplesGroup.new(examples: [example2], language_model: lang_model) }

    it 'returns a positive float for words not in the text but equivalent via the language_model' do
      expect(group2.count('test')).to be > 0
    end
  end
end
