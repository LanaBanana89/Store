class Product

  def initialize(price, amount)

    @price = price
    @amount = amount
    @revenue = 0
  end

  def update

  end

  def get_info

  end

  def show_info
    puts "#{get_info} - #{@price} руб. [осталось: #{@amount}] "
  end

  def self.show_all(products)
    for item in products do
      print (products.index(item) + 1).to_s + " "
      puts item.show_info.to_s
    end
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
      @revenue += @price
      print  "Вы приобрели "
      puts get_info.to_s
    end

  end

end