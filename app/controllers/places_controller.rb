class PlacesController < ApplicationController
  def index
    @places = Place.all
  end

  def show
    @place = Place.find(params[:id])
    # @wishlists = Place.wishlists
  end

  def create
  end
end
