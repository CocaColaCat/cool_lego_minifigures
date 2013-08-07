
class SeriesGateway
  def add_minifigure(minifigure)
    @mongodb_connector.insert(minifigure)
  end

  def get_minifigures
    @mongodb_connector.find({}, {:fields => {:_id => 0}}).to_a
  end

  def initialize(db='lego', collection='minifigure_series')
    @mongodb_connector = MongodbConnector.connect(db, collection)
  end
end
