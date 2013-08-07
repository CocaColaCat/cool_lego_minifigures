require 'mongo'

class MongodbConnector
  def self.connect(db,collection,host='localhost')
    Mongo::MongoClient.new(host)[db][collection]
  end
end
