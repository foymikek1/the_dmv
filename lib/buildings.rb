class Building
  def initialize
  end

  def address_helper(data)
   "#{data[:address_li]} #{data[:address__1]} #{data[:city]} #{data[:state]} #{data[:zip]}"
   
  end

  def make_facilities(data)
    data.map do |facility_data|
      Facility.new(
        name: facility_data[:dmv_office],
        
        address: address_helper(facility_data),
        phone: facility_data[:phone],
        services: [],
        registered_vehicles: [],
        collected_fees: 0
      )
    end
  end

end