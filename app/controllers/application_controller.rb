class ApplicationController < ActionController::API
    #helper methods, since other controllers have access

    def secret_key
        ENV['secret_key']
    end
    
    #given a payload {user_id: ?} => token
    def encode(payload)
        JWT.encode(payload, secret_key, 'HS256')
    end

    #given a token in the form of "abc.123" => generate the payload {user_id: ?}
    def decode(token)
        JWT.decode(token, secret_key, true, {algorithm: "HS256"})[0]
    end


end
