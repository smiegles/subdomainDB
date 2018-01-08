class App < Sinatra::Application
  before do
    #content_type :json
    begin
      request.body.rewind
      @body = JSON.parse(request.body.read) if request.content_length.to_i > 0
    rescue JSON::ParserError => e
      halt 400, Message.error("JSON error: #{e}")
    end
  end
end
