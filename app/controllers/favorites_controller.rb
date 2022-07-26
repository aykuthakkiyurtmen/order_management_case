class FavoritesController < ActionController::API
  include ErrorHandling
  include JwtAuthHelper

  before_action :authentication!

  def create
    user = User.find(@user.id)
    @like = user.likes.new(likeable_id: get_likeable_id, likeable_type: params[:likeable_type])

    return render json: errors[:message] if errors[:status] == 'error'

    begin
      @like.save
      render json: FavoriteSerializer.new(@like).serializable_hash, status: :created
    end
  rescue StandardError => e
    p e.message
    render(json: { error: unknown_error }, status: :internal_server_error)
  end

  private

  def get_likeable_id
    case params[:likeable_type]
    when Constants::STORE
      store = Store.find_by_name(params[:name])
      store&.id
    when Constants::PRODUCT
      product = Product.find_by_name(params[:name])
      product&.id
    else
      Constants::FAIL
    end
  end
end
