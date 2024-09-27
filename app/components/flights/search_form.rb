module Flights
    class SearchForm < ApplicationComponent
        
      def initialize(airports:, params:, flights:)
        @airports = airports
        @params = params
        @flights = flights
      end
  
      def view_template
        form(action: flights_path, method: "get", data: { turbo_frame: "flight-selection" }, class: "space-y-4 p-4") do
          h1(class: "text-2xl font-bold mb-4") { "Search Flights" }
  
          div(class: "form-control") do
            label(class: "label") { span(class: "label-text") { "Departure Airport" } }
            select(name: "departure_airport_id", class: "select select-bordered") do
              @airports.each do |airport|
                option(value: airport.id, selected: airport.id.to_s == @params[:departure_airport_id]) { airport.code }
              end
            end
          end
  
          div(class: "form-control") do
            label(class: "label") { span(class: "label-text") { "Arrival Airport" } }
            select(name: "arrival_airport_id", class: "select select-bordered") do
              @airports.each do |airport|
                option(value: airport.id, selected: airport.id.to_s == @params[:arrival_airport_id]) { airport.code }
              end
            end
          end
  
        div(class: "form-control") do
          label(class: "label") { span(class: "label-text") { "Date" } }
          select(name: "flight_date", class: "select select-bordered") do
            @flights.map { |flight| flight.start_datetime.to_date }.uniq.sort.each do |date|
              option(value: date, selected: date.to_s == @params[:flight_date]) { date.to_s }
            end
          end
        end
  
          div(class: "form-control") do
            label(class: "label") { span(class: "label-text") { "Number of Passengers" } }
            select(name: "num_passengers", class: "select select-bordered") do
              (1..4).each do |num|
                option(value: num, selected: num.to_s == @params[:num_passengers]) { num.to_s }
              end
            end
          end
  
          div(class: "form-control mt-4") do
            button(type: "submit", class: "btn btn-primary w-full") { "Search" }
          end
        end
      end
    end
  end