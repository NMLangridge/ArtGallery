require_relative('../models/artist.rb')
require_relative('../models/exhibit.rb')
require('pry')

Artist.delete_all()
Exhibit.delete_all()

artist1 = Artist.new({
  'first_name' => 'Mark',
  'last_name' => 'Rothko'
  })

artist1.save()

exhibit1 = Exhibit.new({
  'title' => 'Red on Maroon',
  'year' => 1959,
  'description' => 'large unframed oil painting on a vertically orientated rectangular canvas',
  'category' => 'Painting',
  'artist_id' => artist1.id
  })

exhibit2 = Exhibit.new({
  'title' => 'Black on Maroon',
  'year' => 1959,
  'description' => 'large unframed oil painting on a horizontally orientated rectangular canvas',
  'category' => 'Painting',
  'artist_id' => artist1.id
  })

exhibit1.save()
exhibit2.save()

binding.pry
nil
