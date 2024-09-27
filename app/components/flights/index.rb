# app/components/flights/index.rb

module Flights
  class Index < ApplicationComponent
    def initialize(airports:, flights:, search_results:, params:)
      @airports = airports
      @flights = flights
      @search_results = search_results
      @params = params
    end

    def view_template
      render Flights::SearchForm.new(airports: @airports, flights: @flights, params: @params)

      turbo_frame_tag(id: "flight-selection", class: "mt-8") do
        render Flights::FlightOptions.new(flights: @search_results, params: @params)
      end
    end
  end
end
