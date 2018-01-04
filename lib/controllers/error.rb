class App < Sinatra::Application
  not_found do
    status 400
    halt MessageModel.error("Method doesn't exist.")
  end
end
