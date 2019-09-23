require_relative('../db/sql_runner.rb')

class Artist

  attr_reader :id
  attr_accessor :first_name, :last_name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  def save()
    sql = "INSERT INTO artists(first_name, last_name)
    VALUES($1, $2)
    RETURNING id"
    values = [@first_name, @last_name]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  def update()
    sql = "UPDATE artists SET (first_name, last_name)
    = ($1, $2)
    WHERE id = $3"
    values = [@first_name, @last_name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM artists WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def exhibits()
    sql = "SELECT * FROM exhibits WHERE artist_id = $1"
    values = [@id]
    exhibits = SqlRunner.run(sql, values)
    result = exhibits.map { |exhibit| Exhibit.new(exhibit) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM artists"
    artist = SqlRunner.run(sql)
    return Artist.map_items(artist)
  end

  def self.map_items(artist)
    result = artist.map { |artist| Artist.new(artist) }
    return result
  end

  def self.find(id)
    sql ="SELECT * FROM artists WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    artist = self.new(result.first)
    return artist
  end

end
