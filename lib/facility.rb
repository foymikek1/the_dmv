class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(args)
    @name = args[:name]
    @address = args[:address]
    @phone = args[:phone]
    @services = []
  end

  def add_service(service)
    @services << service
  end
end
