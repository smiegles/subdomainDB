require 'net/http'

class App < Sinatra::Application
  not_found do
    File.read(File.join('public', 'index.html'))
  end

  error do
    halt 400, Message.error("Something wen't wrong.")
  end
end
