require 'spec_helper'

describe ExamplesGroup do
  let(:group) { ExamplesGroup.new('spec/training/positive') }

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
end
