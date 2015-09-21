require 'spec_helper'

describe TrainingExamples do

  let(:examples){TrainingExamples.new({path:'spec/training/'})}

  describe 'get_propalities_for' do
    it 'returns a PropabilityCollection with interesting and not_intersting between 0 and 1' do
      expect(examples.get_propalities_for([]).interesting).to be_between(0,1).inclusive
      expect(examples.get_propalities_for(["Blender", "Computer"]).interesting).to be_between(0,1).inclusive
      expect(examples.get_propalities_for(["Blender", "Computer"]).not_interesting).to be_between(0,1).inclusive
    end
  end


end
