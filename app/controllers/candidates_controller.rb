class CandidatesController < ApplicationController

  before_action :set_candidate, only: [:show, :data]

  def index
    @candidates = Candidate.all
  end

  def data
    render json: @candidate.sentiments
  end

  private

  def set_candidate
    @candidate = Candidate.find(params[:id])
  end
end
