class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    if user_signed_in?
      @profile = current_user.profile
    else
      redirect_to root, message: "You must be signed in!"
    end
  end
end
