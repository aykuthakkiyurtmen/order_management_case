class SessionsController < ActionController::API
  include JwtAuthHelper

  def login
    user = User.find_by(email: params[:email])
    password = user.valid_password?(params[:password])

    if password == true
      token = encode_user_data(user.id)

      render json: { token: token }
    else
      render json: { message: 'invalid credentials' }
    end
  end
end
