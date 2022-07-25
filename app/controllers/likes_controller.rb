class LikesController < ApplicationController
  skip_before_action :verify_authenticity_token

  # POST /favorites
  def create
    @like = current_user.likes.new(like_params)
    if !@like.save
      flash[:notice] = @like.errors.full_messages.to_sentence
    else
      redirect_to @like.likeable
    end
  end

  # DELETE /favorites/1
  def destroy
    @like = current_user.likes.find(params[:id])
    likeable = @like.likeable
    @like.destroy
    redirect_to likeable
  end

  private

  # Only allow a list of trusted parameters through.
  def like_params
    params.require(:like).permit(:likeable_id, :likeable_type)
  end
end
