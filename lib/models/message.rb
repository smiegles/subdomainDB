class Message
  def self.error(message)
    response = {}
    response[:success] = false
    response[:message] = message
    JSON.pretty_generate(response)
  end

  def self.success(response)
    response[:success] = true
    JSON.pretty_generate(response)
  end
end
