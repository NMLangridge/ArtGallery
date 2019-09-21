require_relative('../models/artist.rb')
require_relative('../models/exhibit.rb')
require('pry')

Artist.delete_all()
Exhibit.delete_all()

artist1 = Artist.new({
  'first_name' => 'Mark',
  'last_name' => 'Rothko'
  })

artist2 = Artist.new({
  'first_name' => 'Frank',
  'last_name' => 'Bowling'
  })

artist1.save()
artist2.save()

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

exhibit3 = Exhibit.new({
  'title' => 'Mirror',
  'year' => 1966,
  'description' => 'This painting is about aspiration and inclusion.',
  'category' => 'Painting',
  'artist_id' => artist2.id
  })

exhibit4 = Exhibit.new({
  'title' => 'Sacha Jason Guyana Dreams',
  'year' => 1989,
  'description' => 'large scale acrylic painting that evokes places and moods without depicting specific landscapes.',
  'category' => 'Painting',
  'artist_id' => artist2.id
  })

exhibit1.save()
exhibit2.save()
exhibit3.save()
exhibit4.save()

binding.pry
nil
