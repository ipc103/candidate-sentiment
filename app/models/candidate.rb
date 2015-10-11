class Candidate < ActiveRecord::Base
  validates :name, :twitter, presence: true
  has_many :data_points, dependent: :destroy
end
