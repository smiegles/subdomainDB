class App < Sinatra::Application
  get '/api/domain/search/:domain' do
    search = SearchModel.findByDomain(params[:domain])
    MessageModel.success(search)
  end
end
