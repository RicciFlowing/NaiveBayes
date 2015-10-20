require 'spec_helper'

describe PropabilityCollection do
  let(:object_1) { double('objects_with_id', id: 1, word_count: 200) }
  let(:object_2) { double('objects_with_id', id: 2, word_count: 200) }
  let(:categories) { Categories.new(categories: [object_1, object_2]) }
  let(:collection) { PropabilityCollection.new(categories: categories) }
  let(:collection2) { PropabilityCollection.new(categories: categories) }

  describe 'find' do
    it 'returns a float between 0 and 1 ' do
      expect(collection.find(object_1)).to be_between(0, 1)
    end
  end

  describe 'set' do
    it 'sets the value' do
      collection.set(category: object_1, value: 0.1)
      expect(collection.find(object_1)).to eq 0.1
    end
  end

  describe 'multiply' do
    it 'mulitplies the value by the given factor' do
      collection.set(category: object_1, value: 0.5)

      collection.multiply(category: object_1, factor: 0.5)

      expect(collection.find(object_1)).to eq 0.25
    end

    it 'if no category is given it mulitplies all values by the given factor' do
      collection.set(category: object_1, value: 0.5)
      collection.set(category: object_2, value: 0.2)

      collection.multiply(factor: 0.5)

      expect(collection.find(object_1)).to eq 0.25
      expect(collection.find(object_2)).to eq 0.1
    end

  end

  describe 'sum' do
    it 'returns the sum of all propabilities' do
      collection.set(category: object_1, value: 0.5)
      collection.set(category: object_2, value: 0.2)

      expect(collection.sum).to eq 0.7
    end
  end

  describe 'to_s' do
    it 'returns a string containing the propabilities' do
      collection.set(category: object_1, value: 0.5)
      collection.set(category: object_2, value: 0.2)

      expect(collection.to_s).to include 0.5.to_s
      expect(collection.to_s).to include 0.2.to_s
    end
  end
end
