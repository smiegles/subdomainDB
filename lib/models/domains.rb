class DomainsModel

  def initialize(domain)
    @domain = domain
    @success = true
    valid_domain?
  end

  def insert(domains)
    return false unless valid_domains?(domains)
    domains.each do |domain|
      puts domain
    end
    true
  end

  def is_success?
    @success
  end

  private

  def valid_domain?
    valid = ValidationModel.is_valid_domain?(@domain)
    set_success(valid)
    is_success?
  end

  def valid_domains?(domains)
    valid = domains.select { |domain| ValidationModel.is_valid_domain?(domain) }
    set_success(valid.length == domains.length)
    is_success?
  end

  def set_success(value)
    return false if @success == false
    @success = value
  end
end
