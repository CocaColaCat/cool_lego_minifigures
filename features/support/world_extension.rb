module KnowsTheDomain
  def series_gateway
    SeriesGateway.new('test', 'test')
  end
end

World(KnowsTheDomain)
