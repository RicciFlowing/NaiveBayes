require 'spec_helper'

describe FileExample do
  let(:example) { FileExample.new(path: 'spec/training2/negative/test.txt') }

  describe 'text' do
    it 'returns the text of the example' do
      expect(example.text).to include 'test'
    end
  end
end
