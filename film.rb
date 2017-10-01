class Film < Product

  def update(options)
    @title = options[:title]
    @year = options[:year]
    @director_name = options[:director_name]
  end

  def get_info
    "Фильм #{@title}, реж. #{@director_name}, год #{@year}"
  end

end