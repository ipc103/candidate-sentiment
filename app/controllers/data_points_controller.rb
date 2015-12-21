class DataPointsController < ApplicationController

  def index
    @candidates = Candidate.all
  end

end
