class Search
  attr_accessor :offset, :limit, :results

  def initialize(query)
    @query = query
    @offset = 0
    @limit = 10
    @results = {}
  end

  def search
    @results = Domain
      .joins(:subdomains)
      .where(["domains.name LIKE ?", "%#{@query}%"])
      .select('subdomains.id, subdomains.name, subdomains.created_at')
      .limit(@limit)
      .offset(@offset)
  rescue => e
    @results = []
  end

  def debug
    { offset: @offset, limit: @limit }
  end

  def results?
    @results.empty? ? false : true
  end

  def offset=(value)
    @offset = value.to_i
  end

  def limit=(value)
    @limit = value.to_i
  end
end
