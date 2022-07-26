require 'jwt'
# jwt token logics
module JwtAuthHelper
  def authentication!
    decode_data = decode_user_data(request.headers[:Authorization])
    user_data = decode_data[0] if decode_data
    @user = User.find(user_data)

    render json: { message: "invalid credentials" } unless @user
  end

  def encode_user_data(payload)
    JWT.encode payload, JwtTokenHelper::CreateToken::SECRET, "HS256"
  end

  private

  def decode_user_data(token)
    JWT.decode token, nil, false
  rescue StandardError => e
    puts e
  end
end

