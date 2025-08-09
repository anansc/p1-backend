require "jwt"

class JsonWebToken
  SECRET_KEY = "f57a3133618a685da5f55fb9ff03e3a4e3e7ea23171b3c1b049ca2b79cc94d43a527f11de84ff8b89276ddb0db872a74f6490a21cc260ba0196b1a077dc0e85c"

  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new decoded
  rescue JWT::DecodeError
    nil
  end
end
