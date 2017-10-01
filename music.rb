class Music < Product

  def update(options)
    @album_name = options[:album_name]
    @artist_name = options[:artist_name]
    @genre = options[:genre]
  end

  def get_info
    "Песня #{@album_name}, исп. #{@artist_name}, жанр #{@genre}"
  end

end