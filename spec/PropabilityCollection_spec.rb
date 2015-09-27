require 'spec_helper'

describe PropabilityCollection do
  let(:object_with_id){ double("objects_with_id", {id: 1})}
  let(:object_with_id2){ double("objects_with_id", {id: 2})}
  let(:collection){PropabilityCollection.new(categories: [object_with_id,object_with_id2])}
  let(:collection2){PropabilityCollection.new(categories: [object_with_id,object_with_id2])}

  describe "find" do
    it "returns a float between 0 and 1 " do
      expect(collection.find(object_with_id)).to be_between(0,1)
    end
  end

  describe "set" do
    it "sets the value" do
      collection.set( category: object_with_id ,value: 0.1)
      expect(collection.find(object_with_id)).to eq 0.1
    end
  end

  describe "multiply" do
    it "sets the value" do
      collection.set( category: object_with_id ,value: 0.5)

      collection.multiply( category: object_with_id ,factor: 0.5)

      expect(collection.find(object_with_id)).to eq 0.25
    end
  end

end
