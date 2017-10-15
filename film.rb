class Film < Product

  def update(options)
    @title = options[:title]
    @year = options[:year]
    @director_name = options[:director_name]
  end

  def get_info
    "Фильм #{@title}, реж. #{@director_name}, год #{@year}"
  end

  def to_xml(user_title, user_director, user_year)

      film = REXML::Element.new 'film'

      film.attributes['title'] = user_title
      film.attributes['director'] = user_director
      film.attributes['year'] = user_year

      return film
  end


end