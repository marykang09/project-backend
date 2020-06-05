class PosesController < ApplicationController

    def index
        render json: Pose.all
    end
end
