class SequencePosesController < ApplicationController

    # def index
    #     sequence_poses = SequencePose.all
    #     render json: sequence_poses.as_json(include: {pose: { only: [:english_name, :sanskrit_name, :img_url]}})
    # end

    # def create
    #     sequence_pose = SequencePose.create(sequence_pose_params)
    #     render json: sequence_pose.as_json(include: :pose )
    # end



    private
    def sequence_pose_params
        params.require(:sequence_pose).permit(:sequence_id, :pose_id, :position_num)
    end
        
    

end
