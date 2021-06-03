class LikesController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def create
    @like = Like.create(like_parameters) 
    if @like.valid?
      @like.save
      flash[:notice] = "Like was successful!" 
    else
      errors = @like.errors.full_messages
      flash[:error] = "#{errors}" 
    end
  end
  
  def destroy
    @like = Like.find_by(like_parameters)
    @like.destroy!
    flash[:notice] = "Like deleted!" 
  end

  private
  def like_parameters
    params.require(:like).permit(:profile_id, :likeable_id, :likeable_type)
  end
end
