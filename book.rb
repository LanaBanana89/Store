class Book < Product

  def update(options)
    @title = options[:title]
    @name_author = options[:name_author]
  end


  def get_info
    "Книга #{@title}, автор #{@name_author}"
  end

  def title
    @title
  end

  def name_author
    @name_author
  end

  def to_xml(user_title, user_author)
    file_path = File.dirname(__FILE__) + "/products.xml"
    abort "Файл не найден" unless File.exist?(file_path)

    file = File.new(file_path,"r:utf-8")
    doc = REXML::Document.new(file)
    file.close

    book = REXML::Element.new 'book'

    book.attributes['title'] = user_title
    book.attributes['name_author'] = user_author

    return book

  end

end