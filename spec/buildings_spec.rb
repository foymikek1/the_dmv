require '../spec/spec_helper'

RSpec.describe Building do
  before(:each) do
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
    co_dmv_data = DmvDataService.new.co_dmv_office_locations
    mo_dmv_data = DmvDataService.new.mo_dmv_office_locations
    ny_dmv_data = DmvDataService.new.ny_dmv_office_locations
    @co_buildings = Building.new.make_facilities(co_dmv_data)
    @mo_buildings = Building.new.make_facilities(mo_dmv_data)
    @ny_buildings = Building.new.make_facilities(ny_dmv_data)
    @building = Building.new
  end
  describe '#initialize' do
    it 'can initialize' do   
      expect(@building).to be_an_instance_of(Building)
    end
  end

  describe '#make facilities' do
    it 'can make multiple facilities with different state data sets' do
      expect(@co_buildings[0]).to be_an_instance_of Facility
      expect(@co_buildings[-1]).to be_an_instance_of Facility
      expect(@mo_buildings[0]).to be_an_instance_of Facility
      expect(@mo_buildings[-1]).to be_an_instance_of Facility
      expect(@ny_buildings[0]).to be_an_instance_of Facility
      expect(@ny_buildings[-1]).to be_an_instance_of Facility
    end
  end
end
