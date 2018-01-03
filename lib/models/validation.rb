class ValidationModel

  DOMAIN_REGEX = /\A([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?\z/.freeze

  def self.is_valid_domain?(value)
    value.to_s =~ DOMAIN_REGEX ? true : false
  end
end
