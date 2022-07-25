class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_likes, only: [:index]
  load_and_authorize_resource

  def index; end

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

  def set_likes
    @like_products = Product.joins(:likes)
    @like_stores = Store.joins(:likes)
  end

  # Only allow a list of trusted parameters through.
  def like_params
    params.require(:like).permit(:likeable_id, :likeable_type)
  end
end
