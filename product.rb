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

  def update

  end

  def get_info

  end

  def show_info
    puts "#{get_info} - #{self.price} руб. [осталось: #{self.amount}] "
  end

end