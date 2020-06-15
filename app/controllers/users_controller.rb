class UsersController < ApplicationController
    
    def index
        users = User.all
        render json: users.as_json(include: [ { sequences: { include: {sequence_poses: { include: {pose: {except: [:created_at, :updated_at]}}}}}}, :user_quotes ])
    end

    def show
        user = User.find(params[:id])
        render json: user.as_json(include: [ { sequences: { include: {sequence_poses: { include: {pose: {except: [:created_at, :updated_at]}}}}}}, :user_quotes ])
    end

    def create
        user = User.create(user_params)
        user.update(password: params[:password])
        payload = {user_id: user.id}
        token = encode(payload)
        new_hash = {}
        new_hash['user_data'] = user.as_json(include: [ { sequences: { include: {sequence_poses: { include: {pose: {except: [:created_at, :updated_at]}}}}}}, :user_quotes ])
        new_hash['user_data'] = user.as_json(include: [ { sequences: { include: {sequence_poses: { include: {pose: {except: [:created_at, :updated_at]}}}}}}, :user_quotes ])
        new_hash["token"] = token
        render json: new_hash
        # render :json => {user_data: user.as_json(include: [ { sequences: { include: {sequence_poses: { include: {pose: {except: [:created_at, :updated_at]}}}}}}, :user_quotes ]), token: token}
    end

    def decode_token
        token = request.headers["Authenticate"]
        user = User.find(decode(token)["user_id"])
        # render json: user.as_json(include: [ { sequences: { include: {sequence_poses: { include: {pose: {except: [:created_at, :updated_at]}}}}}}, :user_quotes ])
        render :json => {user_data: user.as_json(include: [ { sequences: { include: {sequence_poses: { include: {pose: {except: [:created_at, :updated_at]}}}}}}, :user_quotes ]), token: token}
    end

    
    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :username)
    end

end
