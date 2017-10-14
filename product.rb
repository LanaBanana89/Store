class Product

  def initialize(price, amount)
    @price = price
    @amount = amount
  end

  def price
    @price
  end

  def amount
    @amount
  end

  def update # абстрактный метод, который будет реализован дочерними классами
  end

  def get_info # абстрактный метод, который будет реализован дочерними классами
  end


  def show_info # метод, отображающий информацию о товаре
    puts "#{get_info} - #{@price} руб. [осталось: #{@amount}] "
  end

  def self.show_all(products) # метод, который выводит на экран все товары магазина

    products.each_with_index do |product, index|
      print "#{index + 1}: "
      print product.show_info.to_s
    end

    puts "x. Покинуть магазин"
    puts "d. Добавить товар"
  end


  def buy

    if @amount == 0
      puts "Извините, данного товара нет на складе :("
    else
      @amount -= 1
      puts "*   *   *"
      puts  "Вы приобрели #{get_info}"
      puts "*   *   *"
    end

  end

  def self.read_from_xml(file)
    file_path = File.dirname(__FILE__) + file
    abort "Файл не найден" unless File.exist?(file_path)

    file_name = File.new(file_path,"r:utf-8")
    doc = REXML::Document.new(file_name)
    file_name.close

    result = []
    product = nil
    doc.elements.each('products/product') do |item|
      price = item.attributes['price'].to_i
      amount = item.attributes['amount'].to_i

      item.each_element('book') do |book_item|
      product = Book.new(price, amount)
      product.update(:title => book_item.attributes['title'], :name_author => book_item.attributes['author'])
      end

      item.each_element('film') do |film_item|
        product = Film.new(price, amount)
        product.update(:title => film_item.attributes['title'], :director_name => film_item.attributes['director'], :year => film_item.attributes['year'])
      end

      item.each_element('music') do |music_item|
        product = Music.new(price, amount)
        product.update(:album_name => music_item.attributes['album_name'], :artist_name => music_item.attributes['artist'], :genre => music_item.attributes['genre'])
      end
      result.push(product)
    end
      return result
  end

  def self.add_book(user_cost, user_count, user_title, user_author,file)
    file_path = File.dirname(__FILE__) + "/" + file
    abort "Файл не найден" unless File.exist?(file_path)

    file_name = File.new(file_path,"r:utf-8")
    doc = REXML::Document.new(file_name)
    file_name.close

    product = doc.root.add_element "product", {'price' => user_cost, 'amount' => user_count}

    if !product.has_elements?
    product.add_element "book", {'title' => user_title, 'author' => user_author}
    end
    file_name = File.new(file_path,"w:utf-8")
    doc.write(file_name, 2)
    file_name.close
  end

  def self.add_film(user_cost, user_count, user_title, user_director, user_year, file)
    file_path = File.dirname(__FILE__) + "/" + file
    abort "Файл не найден" unless File.exist?(file_path)

    file_name = File.new(file_path,"r:utf-8")
    doc = REXML::Document.new(file_name)
    file_name.close

    product = doc.root.add_element "product", {'price' => user_cost, 'amount' => user_count}

    if !product.has_elements?
      product.add_element "film", {'title' => user_title, 'director' => user_director, 'year' => user_year}
    end
    file_name = File.new(file_path,"w:utf-8")
    doc.write(file_name, 2)
    file_name.close
  end

  def self.add_music(user_cost, user_count, user_album_name, user_artist, user_genre, file)
    file_path = File.dirname(__FILE__) + "/" + file
    abort "Файл не найден" unless File.exist?(file_path)

    file_name = File.new(file_path,"r:utf-8")
    doc = REXML::Document.new(file_name)
    file_name.close

    product = doc.root.add_element "product", {'price' => user_cost, 'amount' => user_count}

    if !product.has_elements?
      product.add_element "music", {'album_name' => user_album_name, 'artist' => user_artist, 'genre' => user_genre}
    end
    file_name = File.new(file_path,"w:utf-8")
    doc.write(file_name, 2)
    file_name.close
  end

end