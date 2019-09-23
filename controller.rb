require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('./models/artist.rb')
require_relative('./models/exhibit.rb')
also_reload('./models/*')

get '/' do
  erb(:welcome)
end

#Artists

get '/artists' do
  @artists = Artist.all()
  erb(:index_artists)
end

get '/artists/:id' do
  @artist = Artist.find(params[:id])
  @exhibits = @artist.exhibits
  erb(:show_artists)
end

get '/manager/artist/new' do
  erb(:new_artist)
end

post '/manager/artist/new' do
  @artist = Artist.new(params)
  @artist.save()
  erb(:create_artist)
end

get '/manager/artist/:id/edit' do
  @artist = Artist.find(params[:id])
  erb(:edit_artist)
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

#Exhibits

get '/exhibits' do
  @exhibits = Exhibit.all()
  erb(:index_exhibits)
end

get '/exhibits/:id' do
  @exhibit = Exhibit.find(params[:id])
  @artists = @exhibit.artists
  erb(:show_exhibits)
end

get '/manager/exhibit/new' do
    @artists = Artist.all()
  erb(:new_exhibit)
end

post '/manager/exhibit/new' do
  @exhibit = Exhibit.new(params)
  @exhibit.save()
  erb(:create_exhibit)
end

get '/manager/exhibit/:id/edit' do
  @exhibit = Exhibit.find(params[:id])
  @artists = Artist.all()
  erb(:edit_exhibit)
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
