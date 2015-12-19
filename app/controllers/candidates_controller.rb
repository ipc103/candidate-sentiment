class CandidatesController < ApplicationController

  def show
    @candidate = Candidate.find(params[:id])
  end

  def data
    @candidate = Candidate.find(params[:id])
    sentiments = @candidate.data_points.map do |data_point|
      if data_point.tweeted_about_sentiment 
        { createdAt: data_point.created_at.strftime('%y-%m-%d'), 
          probability: data_point.tweeted_about_sentiment } 
      end
    end.flatten
    render json: sentiments
  end
end
