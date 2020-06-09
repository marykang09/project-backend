class SequencesController < ApplicationController

    def index
        sequences = Sequence.all
        render json: sequences.as_json(include: [ { sequence_poses: { include: {pose: {except: [:created_at, :updated_at]}}}}])
    end

    def show
        sequence = Sequence.find(params[:id])
        render json: sequence.as_json(include: [ { sequence_poses: { include: {pose: {except: [:created_at, :updated_at]}}}}])
    end
    
    def create
        mary = User.all.first # use this for now since no other users
        sequence = Sequence.create(user_id: mary.id, name: params[:name], notes: params[:notes] )
        # change to strong params after user is built
        render json: sequence.as_json(include: [ { sequence_poses: { include: {pose: {except: [:created_at, :updated_at]}}}}])
    end

    def update
        sequence = Sequence.find(params[:id])
        sequence.update(sequence_params)
        render json: sequence.as_json(include: [ { sequence_poses: { include: {pose: {except: [:created_at, :updated_at]}}}}])
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
