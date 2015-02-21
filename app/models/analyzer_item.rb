class AnalyzerItem
  include Mongoid::Document

  field :trend, type: String
  field :tweets_urls, type: Array
  field :analys, type: String
  field :date, type: DateTime, default: Time.now
end