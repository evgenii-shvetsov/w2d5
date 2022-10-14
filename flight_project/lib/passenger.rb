class Passenger

    attr_reader :name
    def initialize(name)
        @name = name
        @flight_numbers = []
    end

    def has_flight?(flight_n)
        @flight_numbers.include?(flight_n.upcase)
    end

    def add_flight(flight_n)
        @flight_numbers << flight_n.upcase if !has_flight?(flight_n)
    end
end