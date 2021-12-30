class PlacesController < ApplicationController
  # def index
  #   @places = Place.all
  # end

  def index
    if params[:query].present?
      @places = Place.where("city_name ILIKE ?", "%#{params[:query]}%")
    else
      @places = Place.all
    end
  end

  def show
    @place = Place.find(params[:id])
    # @wishlists = Place.wishlists
  end

  def create
  end
end
