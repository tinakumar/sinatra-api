#get all movies
get '/api/movies' do
  format_response(Movie.all, request.accept)
end

#find movie by id
get '/api/movies/:id' do
  movie ||= Movie.get(params[:id]) || halt(404)
  format_response(movie, request.accept)
end

#add a movie
post '/api/movies' do
  body = JSON.parse request.body.read
  movie = Movie.create(
    title:      body['title'],
    summary:    body['summary'],
    director:   body['director'],
    year:       body['year']
    )
  status 201
  format_response(movie, request.accept)
end

#update a movie
put '/api/movies/:id' do
  body = JSON.parse request.body.read
  movie ||= Movie.get(params[:id]) || halt(404)
  halt 500 unless Movie.update(
    title:      body['title'],
    summary:    body['summary'],
    director:   body['director'],
    year:       body['year']
    )
  format_response(movie, request.accept)
end

delete '/api/movies/:id' do
  movie ||= Movie.get(params[:id]) || halt(404)
  halt 500 unless Movie.destroy
end
