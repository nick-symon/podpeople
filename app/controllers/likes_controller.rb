class LikesController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def create
    @like = Like.create(like_parameters) 
    respond_to do |format|
      if @like.valid?
        @like.save
        format.js
      else
        errors = @like.errors.full_messages
        flash.now[:error] = "#{errors}" 
      end
    end
  end
  
  def destroy
    @like = Like.find_by(like_parameters)
    respond_to do |format|
      @like.destroy!
      format.js
    end
  end

  private
  def like_parameters
    params.require(:like).permit(:profile_id, :likeable_id, :likeable_type)
  end
end
