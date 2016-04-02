class Api::V1::CandidatesController < ApplicationController

  before_action :set_candidate, only: [:show]
  
  def index
    @candidates = Candidate.all
    render json: @candidates
  end

  def show
    render json: @candidate, include: :data_points
  end

  private

  def set_candidate
    @candidate = Candidate.find(params[:id])
  end
end
