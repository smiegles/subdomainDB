class MessageModel
  def self.error(message)
    response = {}
    response[:success] = false
    response[:message] = message
    response.to_json
  end

  def self.success(response)
    response[:success] = true
    response.to_json
  end
end
