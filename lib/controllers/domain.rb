class App < Sinatra::Application
  register Sinatra::ActiveRecordExtension
  register Sinatra::Namespace

  namespace '/api/domain' do

    before do
      content_type :json
    end

    get '/' do
      domain = Domain.new
      Message.success(domains: domain.all.as_json)
    end

    get '/:domain' do
      search = Domain.new
      search.domain = params[:domain]
      search.find
      halt 200, Message.success(domains: search.results.as_json) if search.results?
      halt 400, Message.error('domain not found')
    end

    post '/:domain' do
      halt 403, Message.error('domains not supplied') unless @body.key?('domains')
      halt 403, Message.error('domains should be an array') unless @body['domains'].is_a?(Array)
      domain = Domain.new
      parent = domain.find_or_create(name: params[:domain])
      @body['domains'].each { |subdomain| parent.subdomains.find_or_create_by(name: subdomain, domain: parent) }
      halt 200, Message.success(message: 'domain(s) inserted')
    end

    delete '/:domain/all' do
      Domain.where(name: params[:domain]).destroy_all
      halt 200, Message.success(message: 'Successfully deleted')
    end

    delete '/:domain' do
    end
  end
end
