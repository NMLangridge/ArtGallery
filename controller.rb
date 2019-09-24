require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('./models/artist.rb')
require_relative('./models/exhibit.rb')
also_reload('./models/*')

get '/' do
  erb(:welcome)
end

get '/manager' do
  erb(:"manager/index")
end

#MANAGE ARTISTS

get '/manager/artists' do
  @artists = Artist.all()
  erb(:"manager/index_artists")
end

get '/manager/artists/:id' do
  @artist = Artist.find(params[:id])
  @exhibits = @artist.exhibits
  erb(:"manager/show_artists")
end

get '/manager/artist/new' do
  erb(:"manager/new_artist")
end

post '/manager/artist/new' do
  @artist = Artist.new(params)
  @artist.save()
  erb(:"manager/create_artist")
end

post '/manager/artist/:id/edit' do
  @artist = Artist.find(params[:id])
  erb(:"manager/edit_artist")
end

post '/manager/artist/:id' do
  Artist.new(params).update()
  redirect to '/artists'
end

post '/manager/artist/:id/delete' do
  artist = Artist.find(params[:id])
  artist.delete()
  redirect to '/artists'
end

#MANAGE EXHIBITS

get '/manager/exhibits' do
  @exhibits = Exhibit.all()
  erb(:"manager/index_exhibits")
end

get '/manager/exhibits/:id' do
  @exhibit = Exhibit.find(params[:id])
  @artists = @exhibit.artists
  erb(:"manager/show_exhibits")
end

get '/manager/exhibit/new' do
    @artists = Artist.all()
  erb(:"manager/new_exhibit")
end

post '/manager/exhibit/new' do
  @exhibit = Exhibit.new(params)
  @exhibit.save()
  erb(:"manager/create_exhibit")
end

get '/manager/exhibit/:id/edit' do
  @exhibit = Exhibit.find(params[:id])
  @artists = Artist.all()
  erb(:"manager/edit_exhibit")
end

post '/manager/exhibit/:id' do
  Exhibit.new(params).update
  redirect to '/exhibits'
end

post '/manager/exhibit/:id/delete' do
  exhibit = Exhibit.find(params[:id])
  exhibit.delete()
  redirect to '/exhibits'
end

#ARTISTS

get '/artists' do
  @artists = Artist.all()
  erb(:index_artists)
end

get '/artists/:id' do
  @artist = Artist.find(params[:id])
  @exhibits = @artist.exhibits
  erb(:show_artists)
end

#EXHIBITS

get '/exhibits' do
  @exhibits = Exhibit.all()
  @artists = Artist.all()
  erb(:index_exhibits)
end

get '/exhibits/filter' do
  artist_id = params["artist_id"].to_i
  # find the artist with the artist id variable
  # from that artist, get all their exhibits - assign it to @exhibits
  artist = Artist.find(artist_id)
  @exhibits = artist.exhibits()
  @artists = Artist.all()
  erb(:index_exhibits)
end

get '/exhibits/:id' do
  @exhibit = Exhibit.find(params[:id])
  @artists = @exhibit.artists()
  erb(:show_exhibits)
end
