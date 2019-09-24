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
  'description' => 'Intimations of mortality.',
  'category' => 'Painting',
  'artist_id' => artist1.id,
  'image_url' => 'https://www.tate.org.uk/art/images/work/T/T01/T01165_10.jpg'
  })

exhibit2 = Exhibit.new({
  'title' => 'Black on Maroon',
  'year' => 1959,
  'description' => '90% tragedy, 10% hope.',
  'category' => 'Painting',
  'artist_id' => artist1.id,
  'image_url' => 'https://www.tate.org.uk/art/images/work/T/T01/T01163_515930_10.jpg'
  })

exhibit3 = Exhibit.new({
  'title' => 'Mirror',
  'year' => 1966,
  'description' => 'A conflicted figure caught between two worlds.',
  'category' => 'Painting',
  'artist_id' => artist2.id,
  'image_url' => 'https://www.tate.org.uk/art/images/work/T/T13/T13936_10.jpg'
  })

exhibit4 = Exhibit.new({
  'title' => 'Sacha Jason Guyana Dreams',
  'year' => 1989,
  'description' => 'A vist to Guyana.',
  'category' => 'Painting',
  'artist_id' => artist2.id,
  'image_url' => 'https://www.tate.org.uk/art/images/work/T/T12/T12134_10.jpg'
  })

exhibit1.save()
exhibit2.save()
exhibit3.save()
exhibit4.save()

binding.pry
nil
