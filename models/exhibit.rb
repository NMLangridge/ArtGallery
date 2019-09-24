require_relative('../db/sql_runner.rb')

class Exhibit

  attr_reader :id
  attr_accessor :title, :year, :description, :category, :artist_id, :image_url

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @year = options['year'].to_i
    @description = options['description']
    @category = options['category']
    @artist_id = options['artist_id'].to_i
    @image_url = options['image_url']
  end

  def save()
    sql = "INSERT INTO exhibits(title, year, description, category, artist_id, image_url)
    VALUES($1, $2, $3, $4, $5, $6)
    RETURNING id"
    values = [@title, @year, @description, @category, @artist_id, @image_url]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  def update()
    sql = "UPDATE exhibits SET (title, year, description, category, artist_id, image_url)
    = ($1, $2, $3, $4, $5, $6)
    WHERE id = $7"
    values = [@title, @year, @description, @category, @artist_id, @id, @image_url]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM exhibits WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def artists()
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    artists = SqlRunner.run(sql, values)
    result = artists.map { |artist| Artist.new(artist) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM exhibits"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM exhibits"
    exhibit = SqlRunner.run(sql)
    return Exhibit.map_items(exhibit)
  end

  def self.map_items(exhibit)
    result = exhibit.map { |exhibit| Exhibit.new(exhibit) }
    return result
  end

  def self.find(id)
    sql ="SELECT * FROM exhibits WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    exhibit = self.new(result.first)
    return exhibit
  end

end
