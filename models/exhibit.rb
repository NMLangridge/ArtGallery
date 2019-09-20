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

end
