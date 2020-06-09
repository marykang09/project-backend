class SequencePosesController < ApplicationController

    def create
        # byebug
        sequence_pose = SequencePose.create(sequence_pose_params)
        render json: sequence_pose.as_json(include: :pose )
    end

    def destroy
        sequence_pose = SequencePose.find(params[:id])
        sequence_pose.destroy
    end

    private
    def sequence_pose_params
        params.require(:sequence_pose).permit(:sequence_id, :pose_id, :position_num)
    end
        
    

end
