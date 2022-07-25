require 'jwt'

class SessionsController < ActionController::API

  def login
    user = User.find_by(email: params[:email])

    password = user.valid_password?(params[:password])

    # you can use bcrypt to password authentication
    if password == true

      # we encrypt user info using the pre-define methods in application controller
      token = JwtTokenHelper::CreateToken.encode_user_data(user.id)

      # return to user
      render json: { token: token }
    else
      render json: { message: "invalid credentials" }
    end
  end
end