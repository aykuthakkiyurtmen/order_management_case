class FavoritesController < ActionController::API
  include JwtAuthHelper
  before_action :authentication!

  def create
    user = User.find(@user.id)
    @like = user.likes.new(like_params)
    if !@like.save
      render json: {status: "error", code: 3000, message: "Can"}
    else
      render json: @like, status: :created
    end
  end

  private

  def like_params
    params.require(:like).permit( :likeable_id, :likeable_type)
  end
end
