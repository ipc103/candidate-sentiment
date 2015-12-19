class CandidatesController < ApplicationController

  def show
    @candidate = Candidate.find(params[:id])
  end

  def data
    @candidate = Candidate.find(params[:id])
    render json: @candidate.sentiments
  end
end
