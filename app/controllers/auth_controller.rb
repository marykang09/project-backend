class AuthController < ApplicationController

    def create
        # byebug
        user = User.find_by(username: params[:username])

        if user && user.authenticate(params[:password])
            payload = {user_id: user.id}
            token = encode(payload)
            new_hash = {}
            new_hash["user_data"] = user
            new_hash["token"] = token

            render json: new_hash
        else
            #username wasn't found or password incorrect
            render json: {
              error_message: "Incorrect username or password"
            }
        end

    end



end