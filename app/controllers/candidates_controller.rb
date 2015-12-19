class CandidatesController < ApplicationController

  def show
    @candidate = Candidate.find(params[:id])
  end

  def data
    @candidate = Candidate.find(params[:id])
    sentiments = @candidate.data_points.map { |data_point| {createdAt: data_point.created_at.strftime('%y-%m-%d'), probability: data_point.tweeted_about_sentiment} }
    render json: sentiments
  end
end
