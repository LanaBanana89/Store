class Book < Product

  def initialize(price, amount)
    super
    @title
    @name_author
  end

  def update(options)
    @title = options[:title]
    @name_author = options[:name_author]
  end

  def title
    @title
  end

  def name_author
    @name_author

  end

end