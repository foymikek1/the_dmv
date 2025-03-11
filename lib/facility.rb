class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles

  def initialize(args)
    @name = args[:name]
    @address = args[:address]
    @phone = args[:phone]
    @services = []
    @registered_vehicles = []
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    @registered_vehicles << vehicle
    vehicle.registration_date = Date.today
    if vehicle.antique?
      vehicle.plate_type = :antique
    elsif vehicle.electric_vehicle?
      vehicle.plate_type = :ev
    else 
      vehicle.plate_type = :regular
    end
  end
end
