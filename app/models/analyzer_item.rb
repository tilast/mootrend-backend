class AnalyzerItem
  include Mongoid::Document

  field :state,  type: String
  field :analys, type: String
  field :date,   type: DateTime, default: Time.now
end