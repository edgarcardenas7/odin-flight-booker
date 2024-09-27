class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    @flights = Flight.all 

    @search_results = if params[:departure_airport_id].present? && params[:arrival_airport_id].present? && params[:flight_date].present?
      Flight.where(
        departure_airport_id: params[:departure_airport_id],
        arrival_airport_id: params[:arrival_airport_id],
        start_datetime: params[:flight_date].to_date.all_day
      )
    else
      []
    end

    respond_to do |format|
      format.html do
        render Flights::Index.new(
          airports: @airports, 
          flights: @flights,  # Pass all flights here
          search_results: @search_results, 
          params: params
        )
      end
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          'flight-selection', 
          Flights::FlightOptions.new(flights: @search_results, params: params)
        )
      end
    end
  end
end