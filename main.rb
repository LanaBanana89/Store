if (Gem.win_platform?) # Отображение русских букв на windows
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative 'product.rb' # подключаем классы
require_relative 'film.rb'
require_relative 'music.rb'
require_relative 'book.rb'

products = [] # создаём массив, куда будем загружать товары

book = Book.new(150, 0) # создаём объект класса "Book"
book.update(:title => "Алхимик", :name_author => "Пауло Коэльо") # присваиваем объекту название книги и имя автора
products << book # кладём объект в массив товаров

film = Film.new(200, 50)
film.update(:title => "Убить Билла", :director_name => "Тарантино", :year => 2003)
products << film

music = Music.new(100, 200)
music.update(:album_name => 'Кислород', :artist_name => 'Артем Пивоваров', :genre => 'Pop')
products << music

user_buy = 0

loop do

Product.show_all(products) # запускаем метод отображения всех товаров магазина

puts "Какой товар желаете приобрести?"

choice = STDIN.gets.chomp

 while (choice != "x" && choice.to_i == 0) ||  !(choice.to_i =~ /^\d$/) && !(choice.to_i <= products.size) # проверка на кооректный ввод пользователя

  Product.show_all(products)
  puts "Выберите товар или нажмите x"
  choice = STDIN.gets.chomp

 end
puts user_buy
puts products[choice.to_i - 1].buy

break if choice == "x"

user_buy += products[choice.to_i - 1].price
puts user_buy
end

if user_buy == 0
  puts "У вас 0 покупок! Всего доброго. Может быть, в следующий раз Вам удастся что-нибудь подобрать"
else
  puts "Спасибо за покупки! С вас #{user_buy} руб."
end

#products[choice.to_i - 1].buy # запускаем метод buy родительского класса Product

#puts "Остаток данного товара: #{products[choice.to_i - 1].amount}"

#puts "Доход магазина: #{products[choice.to_i - 1].revenue}"

