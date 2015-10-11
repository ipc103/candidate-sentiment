class CreateDataPoints < ActiveRecord::Migration
  def change
    create_table :data_points do |t|
      t.date :date
      t.references :candidate, index: true, foreign_key: true
      t.float :tweet_sentiment
      t.float :tweeted_about_sentiment

      t.timestamps null: false
    end
  end
end
