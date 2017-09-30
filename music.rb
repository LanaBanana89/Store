class Music < Product

  def initialize(price, amount)
    super
    @album_name
    @artist_name
    @genre
  end

  def update(options)
    @album_name = options[:album_name]
    @artist_name = options[:artist_name]
    @genre = options[:genre]
  end

  def album_name
      @album_name
  end

  def artist_name
    @artist_name
  end

  def genre
    @genre
  end
end