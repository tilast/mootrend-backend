require 'json'

get '/api/v1/analyzer_items.json' do
  begin
    if params[:state]
      res = AnalyzerItem.where(state: /#{params[:state]}/i).avg(:analys)
    else
      res = nil
    end


    response.headers['Access-Control-Allow-Origin'] = '*'
    content_type :json
    
    (res ? { result: res } : { result: nil }).to_json
  rescue e
    p e
  end
end