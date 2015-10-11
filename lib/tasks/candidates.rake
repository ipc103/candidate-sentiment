namespace :candidates do
  desc "daily task to create datapoints for candidates"
  task create_data_points: :environment do
    Candidate.all.each do |candidate|
      detector = Detector.new(name: candidate.name, twitter: candidate.twitter)
      data_point = DataPoint.new
      data_point.date = Date.today
      data_point.candidate = candidate
      begin
        data_point.tweet_sentiment = detector.overall_user_probability
        data_point.tweeted_about_sentiment = detector.tweets_about_probability
      rescue NoMethodError => e
        puts "error in data collection for #{candidate.name}"
      end
      data_point.save
    end
  end

end
