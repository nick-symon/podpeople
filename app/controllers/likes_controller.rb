class LikesController < ApplicationController
  # before_action :authenticate_user!

  def show
  end

  def create
    @profile = current_user.profile
    @like = Like.create(profile_id: @profile.id, likeable_id: params[:likeable_id], likeable_type: params[:likeable_type]) 
    if @like.valid?
      @like.save
      flash[:notice] = "Like was successful!" 
    else
      errors = @like.errors.full_messages
      flash[:notice] = "#{errors}" 
    end
  end
  
  def destory
  end

  # private
  # def like_parameters
  #   params.permit(:profile_id, :likeable_id, :likeable_type)
  # end
end
