class Domain < ActiveRecord::Base
  has_many :subdomains, dependent: :destroy
  attr_accessor :domain, :query
  attr_reader :results

  @results = []

  def find
    @results = Domain.find_by!(name: @domain).subdomains.select('id, name, created_at')
  rescue => e
    @results = []
  end

  def find_or_create(domain)
    Domain.find_or_create_by(domain)
  end

  def delete?(delete)
    Domain.delete(delete)
  end

  def results?
    @results.length > 0
  end
end
