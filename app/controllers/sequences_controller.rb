class SequencesController < ApplicationController

    def index
        sequences = Sequence.all
        render json: sequences.as_json(include: [ { sequence_poses: { include: {pose: {except: [:created_at, :updated_at]}}}}])
    end
    #        render json: sequences.as_json(include: [ { sequence_poses: { include: {pose: {except: [:created_at, :updated_at]}}}}])
    def create
        sequence = Sequence.create(sequence_params)
        render json: sequence.as_json(include: :pose )
    end

    def update
        sequence = Sequence.find(params[:id])
        sequence.update(sequence_params)
        render json: sequence.as_json(include: :pose)
    end

    def destroy
        sequence = Sequence.find(params[:id])
        sequence.destroy
    end

    private
    def sequence_params
        params.require(:sequence).permit(:user_id, :name, :notes)
    end
    
end
