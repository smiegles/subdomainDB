class App < Sinatra::Application
  get '/api/domain/search/:domain' do
    search = SearchModel(params[:domain])
    return MessageModel.success(search.results) if search.find?

    halt 400
    MessageModel.error('No results')
  end
end
