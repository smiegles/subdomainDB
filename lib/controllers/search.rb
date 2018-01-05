class App < Sinatra::Application

  register Sinatra::ActiveRecordExtension
  register Sinatra::Namespace

  namespace '/api/domain/search' do
    get '/:query' do
      domain_search = Search.new(params[:query])
      domain_search.offset = params[:offset] if params[:offset]
      domain_search.limit = params[:limit] if params[:limit]
      domain_search.search
      halt 200, Message.success(domains: domain_search.results.as_json, debug: domain_search.debug) if domain_search.results?
      halt 400, Message.error('No results')
    end
  end
end
