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

end