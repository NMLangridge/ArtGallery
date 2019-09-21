require_relative('../db/sql_runner.rb')

class Exhibit

  attr_reader :id
  attr_accessor :title, :year, :description, :category, :artist_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @year = options['year'].to_i
    @description = options['description']
    @category = options['category']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO exhibits(title, year, description, category, artist_id)
    VALUES($1, $2, $3, $4, $5)
    RETURNING id"
    values = [@title, @year, @description, @category, @artist_id]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  def artists()
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@id]
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

end
