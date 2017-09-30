class Film < Product

  def initialize(price, amount)
    super
    @title
    @year
    @director_name
  end

  def update(options)
    @title = options[:title]
    @year = options[:year]
    @director_name = options[:director_name]
  end

  def title
    @title
  end

  def year
    @year
  end

  def director_name
    @director_name
  end

end