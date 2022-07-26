class FavoritesController < ActionController::API
  include JwtAuthHelper
  include ErrorHandling
  before_action :authentication!

  def create
    user = User.find(@user.id)
    return render json: no_type_error if get_likeable_id.nil?

    like = user.likes.new(likeable_id: get_likeable_id, likeable_type: params[:likeable_type])

    return render json: invalid_likeable_type_error unless likeable_type_valid?

    return render json: exist_like_error if exist?(like.likeable_id)

    if !like.save
      render json: { status: 'error', code: 3000, message: 'Can' }
    else
      render json: FavoriteSerializer.new(like).serializable_hash, status: :created
    end
  end

  private

  def get_likeable_id
    case params[:likeable_type]
    when 'Store'
      store = Store.find_by_name(params[:name])
      store&.id
    when 'Product'
      product = Product.find_by_name(params[:name]).id
      product&.id
    else
      'fail'
    end
  end
end
