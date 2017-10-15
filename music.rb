class Music < Product

  def update(options)
    @album_name = options[:album_name]
    @artist_name = options[:artist_name]
    @genre = options[:genre]
  end

  def get_info
    "Песня #{@album_name}, исп. #{@artist_name}, жанр #{@genre}"
  end

  def to_xml(user_album_name, user_artist, user_genre)
    music = REXML::Element.new 'music'

    music.attributes['album_name'] = user_album_name
    music.attributes['artist'] = user_artist
    music.attributes['genre'] = user_genre

    return music
  end

end