require '../spec/spec_helper'

RSpec.describe Registrant do
  before(:each) do
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 15)
  end
  describe "#initialize" do
    it 'can intitialize' do
      expect(@registrant_1).to be_an_instance_of Registrant
      expect(@registrant_1.name).to eq "Bruce"
      expect(@registrant_1.age).to eq 18
      expect(@registrant_1.permit).to eq true
      expect(@registrant_2.name).to eq "Penny"
      expect(@registrant_2.age).to eq 15
      expect(@registrant_2.permit).to eq false
    end
  end

  describe "permit?" do
    it 'can determine if a registrant has a permit or not' do
      expect(@registrant_1.permit?).to eq true
      expect(@registrant_2.permit?).to eq false
    end
  end

  describe "earn permit" do
    it 'registrant can earn a permit' do
      expect(@registrant_1.permit).to eq true
      expect(@registrant_2.permit).to eq false
      @registrant_2.earn_permit
      expect(@registrant_2.permit).to eq true
    end
  end

  describe "liscence data" do
    it 'can output a registrants liscence data' do
      expected_1 = {:written=>false, :license=>false, :renewed=>false}
      expected_2 = {:written=>false, :license=>false, :renewed=>false}
      expect(@registrant_1.liscence_data).to eq expected_1
      expect(@registrant_2.liscence_data).to eq expected_2
    end
  end
end

