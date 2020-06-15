class UsersController < ApplicationController
    
    def index
        users = User.all
        render json: users, include: [:sequences, :user_quotes]
    end

    def create
        user = User.create(user_params)
        user.update(password: params[:password])
        payload = {user_id: user.id}
        token = encode(payload)
        new_hash = {}
        new_hash['user_data'] = user
        new_hash["token"] = token
        render json: new_hash
    end

    def decode_token
        token = request.headers["Authenticate"]
        user = User.find(decode(token)["user_id"])
        render json: user, include: [:sequences, :user_quotes]
    end

    
    private

    def user_params
        params.require(:user).permit(:username, :first_name, :last_name)
    end

end
