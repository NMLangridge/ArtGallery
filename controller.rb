require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('./models/artist.rb')
require_relative('./models/exhibit.rb')
also_reload('./models/*')

get '/' do
  erb(:welcome)
end

get '/artists' do
  @artists = Artist.all()
  erb(:show_artists)
end

get '/exhibits' do
  @exhibits = Exhibit.all()
  erb(:show_exhibits)
end

get '/manager/new/artist' do
  erb(:new_artist)
end

get '/manager/new/exhibit' do
  erb(:new_exhibit)
end
