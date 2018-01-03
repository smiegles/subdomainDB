class App < Sinatra::Application
  before do
    content_type :json
  end
end
