class EarthquakesController < ApplicationController
  def index
    query = EarthquakeQuery.new(params)

    # TODO: add pagination
    render json: query.all
  end
end
