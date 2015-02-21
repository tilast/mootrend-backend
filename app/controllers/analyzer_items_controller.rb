require 'json'

get '/api/v1/analyzer_items.json' do
  AnalyzerItem.limit(10).to_json
end