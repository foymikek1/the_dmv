require '../spec/spec_helper'

RSpec.describe Registrant do
  before(:each) do
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 16)
    @registrant_3 = Registrant.new('Tucker', 15 )
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
  end
  describe "#initialize" do
    it 'can intitialize' do
      expect(@registrant_1).to be_an_instance_of Registrant
      expect(@registrant_1.name).to eq "Bruce"
      expect(@registrant_1.age).to eq 18
      expect(@registrant_1.permit).to eq true
      expect(@registrant_2.name).to eq "Penny"
      expect(@registrant_2.age).to eq 16
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

  describe "#administer written test" do
    it 'registrant can gain drivers liscence ' do
      # A written test can only be administered to registrants
      # with a permit and who are at least 16 years of age
      written_false = {:written=>false, :license=>false, :renewed=>false}
      written_true = {:written=>true, :license=>false, :renewed=>false}

      expect(@registrant_1.liscence_data).to eq written_false
      expect(@registrant_1.permit?).to eq true
      expect(@facility_1.administer_written_test(@registrant_1)).to eq false
      expect(@registrant_1.liscence_data).to eq written_false
      expect(@facility_1.add_service("Written Test")).to eq ["Written Test"]
      expect(@facility_1.administer_written_test(@registrant_1)).to eq true
      expect(@registrant_1.liscence_data).to eq written_true

      expect(@registrant_2.age).to eq 16
      expect(@registrant_2.permit?).to eq false
      expect(@facility_1.administer_written_test(@registrant_2)).to eq false
      @registrant_2.earn_permit
      expect(@facility_1.administer_written_test(@registrant_2)).to eq true
      expect(@registrant_2.liscence_data).to eq written_true

      expect(@registrant_3.age).to eq 15
      expect(@registrant_3.permit?).to eq false
      expect(@facility_1.administer_written_test(@registrant_3)).to eq false
      @registrant_3.earn_permit
      expect(@facility_1.administer_written_test(@registrant_3)).to eq false
      expect(@registrant_3.liscence_data).to eq written_false
    end
  end
end

