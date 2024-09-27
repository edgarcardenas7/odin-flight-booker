module Flights
    class FlightOptions < ApplicationComponent
        
      def initialize(flights:, params: {})
        @flights = flights
        @params = params
      end
  
      def view_template
        if @flights.present?
          @flights.each do |flight|
            p(class: "text-lg mb-2") do
              "#{flight.departure_airport.code} to #{flight.arrival_airport.code} on #{flight.start_datetime}"
            end
          end
        else
          p(class: "text-red-500") { "No flights found." }
        end
      end
    end
  end
  