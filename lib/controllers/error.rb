class App < Sinatra::Application
  not_found do
    halt 400, Message.error("Method doesn't exist.")
  end

  error do
    halt 400, Message.error("Something wen't wrong.")
  end
end
