require 'spec_helper'

describe Category do
  let(:examples_double) { double('examples', count: 1, word_count: 10) }
  let(:category) { Category.new(name: 'test', examples: examples_double) }
  let(:category2) { Category.new(name: 'test2', examples: examples_double) }

  describe 'p' do
    it 'returns the frequency of a word in the examples' do
      expect(category.p('test')).to eq 0.1
    end
  end

  describe 'word_count' do
    it 'returns the number of words in the examples' do
      expect(category.word_count).to eq 10
    end
  end

  describe 'name' do
    it 'returns its name' do
      expect(category.name).to eq 'test'
    end
  end

  describe 'to_s' do
    it 'returns its name' do
      expect(category.to_s).to eq category.name
    end
  end

  describe 'id' do
    it 'returns an id' do
      expect(category.id).to be > 0
    end
    it 'id is unique' do
      expect(category.id).not_to eq category2.id
    end
  end
end
