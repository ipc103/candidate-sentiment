class Candidate < ActiveRecord::Base
  validates :name, :twitter, presence: true
  has_many :data_points, dependent: :destroy

  def sentiments
    self.data_points.map do |data_point|
      if data_point.tweeted_about_sentiment 
        { createdAt: data_point.created_at.strftime('%y-%m-%d'), 
          probability: data_point.tweeted_about_sentiment } 
      end
    end.compact
  end
end
