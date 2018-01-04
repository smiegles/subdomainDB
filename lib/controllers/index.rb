class App < Sinatra::Application
  before do
    content_type :json
    begin
      request.body.rewind
      @body = JSON.parse(request.body.read) if request.content_length.to_i > 0
    rescue JSON::ParserError => e
      status 400
      halt MessageModel.error("JSON error: #{e}")
    end
  end
end
