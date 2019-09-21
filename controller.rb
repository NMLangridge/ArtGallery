require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('./models/artist.rb')
require_relative('./models/exhibit.rb')
also_reload('./models/*')

get '/' do
  erb(:welcome)
end
