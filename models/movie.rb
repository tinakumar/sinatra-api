class Movie
  include DataMapper::Resource

  property :id,       Serial
  property :title,    String
  property :summary,  Text
  property :director, String
  property :year,     Integer
end





