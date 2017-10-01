class Product

  def initialize(price, amount)

    @price = price
    @amount = amount
  end

  def update

  end

  def get_info

  end

  def price
    @price
  end

  def show_info
    puts "#{get_info} - #{@price} руб. [осталось: #{@amount}] "
  end

  def self.show_all(products)

    products.each_with_index do |product, index|
    print "#{index + 1}: "
    puts product.show_info.to_s
    end
    puts "x. Покинуть магазин"
  end

  def amount
    @amount
  end

  def revenue
    @revenue
  end

  def buy

    if @amount == 0
      puts "Извините, данного товара нет на складе :("
    else
      @amount -= 1
      print  "Вы приобрели "
      puts get_info.to_s
    end

  end

end