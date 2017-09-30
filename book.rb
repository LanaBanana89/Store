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


  def get_info
    "Книга #{@title}, автор #{@name_author}"
  end

end