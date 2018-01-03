class App < Sinatra::Application
  post '/api/domain/:domain' do
    begin
      body = JSON.parse(request.body.read)
      return MessageModel.error('domains not supplied') unless body.key?('domains')
      return MessageModel.error('domains should be an array') unless body['domains'].respond_to?('each')
      domains = DomainsModel.new(params['domain'])
      domains.insert(body['domains'])
      if domains.is_success?
        MessageModel.success(message: 'domains inserted')
      else
        status 400
        MessageModel.error("Something wen't wrong")
      end
    rescue JSON::ParserError => e
      status 400
      MessageModel.error('invalid JSON')
    end
  end
end
