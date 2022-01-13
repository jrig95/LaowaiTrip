class UsersController < ApplicationController

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to profile_path
    else
      puts "Error"
      puts @user.errors.full_messages
    end
  end


  private

  def user_params
    params.require(:user).permit(:photo)
  end
end
