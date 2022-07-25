require 'jwt'

module JwtTokenHelper

  # create jwt token
  class CreateToken
    SECRET = "yoursecretword"

    # turn user data (payload) to an encrypted string  [ B ]
    def encode_user_data(payload)
      JWT.encode payload, SECRET, "HS256"
    end

    # decode token and return user info, this returns an array, [payload and algorithms] [ B ]
    def decode_user_data(token)
      begin
        JWT.decode token, SECRET, true, { algorithm: "HS256" }
      rescue => e
        puts e
      end
    end
  end
end
