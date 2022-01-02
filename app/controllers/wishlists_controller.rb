class WishlistsController < ApplicationController
  def new
  end

  def create
    place = Place.find(params[:place_id])
    wishlist = current_user.wishlists.build(place: place)

    if wishlist.save
      flash[:notice] = "Saved as favorite!"
    else
      flash[:alert] = "Favorite failed to save."
    end
  end
end
