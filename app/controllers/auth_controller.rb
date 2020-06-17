class AuthController < ApplicationController

    def create
        # byebug
        user = User.find_by(username: params[:username])

        if user && user.authenticate(params[:password])
            payload = {user_id: user.id}
            token = encode(payload)
            # new_hash = {}
            # new_hash["user_data"] = user.as_json #include everything here
            # new_hash["token"] = token
            # render json: new_hash
            # render :json => {user_data: user.as_json(include: [ { sequences: { include: {sequence_poses: { include: {pose: {except: [:created_at, :updated_at]}}}}}}, :user_quotes ]), token: token}
            render :json => {user_data: user.as_json(include: [ { sequences: { include: {sequence_poses: { include: {pose: {except: [:created_at, :updated_at]}}}}}}, {user_quotes: {include: {quote: {except: [:created_at, :updated_at]}}}}]), token: token}
        else
            #username wasn't found or password incorrect
            render json: {
              error_message: "Incorrect username or password"
            }
        end

    end



end
