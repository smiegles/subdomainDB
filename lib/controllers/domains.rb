class App < Sinatra::Application
  get '/api/domain/:domain' do
    domains = DomainsModel.new(params['domain'])
    halt 400, MessageModel.error('domain not found') unless domains.find?
  end

  post '/api/domain/:domain' do
    halt 403, MessageModel.error('domains not supplied') unless @body.key?('domains')
    halt 403, MessageModel.error('domains should be an array') unless @body['domains'].is_a?(Array)
    domains = DomainsModel.new(params['domain'])
    insert = domains.insert?(@body['domains'])
    halt 201, MessageModel.success(message: 'domains inserted') if insert
    halt 400, MessageModel.error("Something wen't wrong")
  end

  delete '/api/domain/:domain' do
    domains = DomainsModel.new(params['domain'])
    delete = domains.delete?
    halt 200, MessageModel.success(message: 'Successfully deleted') if delete
    halt 400, MessageModel.error("Couldn't delete #{params['domain']}")
  end
end
