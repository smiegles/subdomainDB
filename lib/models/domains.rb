class DomainsModel
  def initialize(domain)
    @domain = domain
    @error = false
    valid_domain?
  end

  def delete?
    return false if is_error?
    true
  end

  def insert?(domains)
    return false unless valid_domains?(domains)
    return false if is_error?
    domains.each do |domain|
      puts domain
    end
    true
  end

  def is_error?
    @error
  end

  private

  def valid_domain?
    valid = ValidationModel.is_valid_domain?(@domain)
    set_error(true) unless valid
    is_error? == false
  end

  def valid_domains?(domains)
    valid = domains.select { |domain| ValidationModel.is_valid_domain?(domain) }
    set_error(true) unless valid.length == domains.length
    is_error? == false
  end

  def set_error(value)
    return true if @success == true
    @success = value
  end
end
