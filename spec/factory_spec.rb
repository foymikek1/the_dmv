require '../spec/spec_helper'

 describe '#initialize' do
   it 'can initialize' do
    factory = Factory.new
    expect(factory).to be_an_instance_of Factory
   end
   
   it 'can create many vehicles' do
     wa_ev_registrations = DmvDataService.new.wa_ev_registrations
     factory = Factory.new
     vehicles = factory.create_vehicles(wa_ev_registrations)

      expect(vehicles.size).to eq wa_ev_registrations.size
      expect(vehicles[0]).to be_an_instance_of Vehicle
      expect(vehicles[-1]).to be_an_instance_of Vehicle
   end
 end
