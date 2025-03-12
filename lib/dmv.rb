class Dmv
  attr_accessor :facilities
  def initialize
    @facilities = []
  end

  def add_facility(facility)
    @facilities << facility
  end

  def facilities_offering_service(service)
    found_facilities = []
    @facilities.each do |facility|
      if facility.services.include?(service)
        found_facilities << facility
      end
    end
    found_facilities
  end
end
