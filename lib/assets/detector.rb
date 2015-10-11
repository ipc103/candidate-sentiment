class Detector

  attr_accessor :analyzer, :client, :twitter_handle, :name

  def initialize(args)
    Sentimentalizer.setup
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["CONSUMER_KEY"]
      config.consumer_secret     = ENV["CONSUMER_SECRET"]
      config.access_token        = ENV["ACCESS_TOKEN"]
      config.access_token_secret = ENV["ACCESS_SECRET"]
    end
    @name = args[:name]
    @twitter_handle = args[:twitter]
  end

  def user_timeline
    client.user_timeline(twitter_handle)
  end

  def user_timeline_count
    user_timeline.count
  end

  def tweets_about
    client.search(name).take(75)
  end


  ### Sentiment methods

  #### By the person

  def get_sentiment(text)
    Sentimentalizer.analyze(text)
  end

  def overall_probability(text)
    get_sentiment(text).overall_probability
  end

  def sum_probability(tweets)
    tweets.map {|tweet| overall_probability(tweet.full_text) }.inject(:+)
  end

  #### about the person

  def overall_user_probability
    sum_probability(user_timeline) / user_timeline_count
  end

  def tweets_about_probability
    sum_probability(tweets_about) / tweets_about.count
  end


end