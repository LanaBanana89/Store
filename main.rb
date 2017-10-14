if (Gem.win_platform?) # Код для отображения русских букв на windows
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
require 'rexml/document'

#products = [] # создаём массив, куда будем загружать товары

products = Product.read_from_xml('/products.xml')

user_buy = 0 # Изначально общая стоимость товаров в корзине покупателя "ноль"

loop do # запускаем цикл для выбора покупателем товаров из магазина

Product.show_all(products) # запускаем метод отображения всех товаров магазина

puts "Какой товар желаете приобрести?"

choice = STDIN.gets.chomp # записываем в переменную choice выбор покупаятеля

 while (choice != "x" && choice != "d" && choice.to_i == 0) ||  !(choice.to_i =~ /^\d$/) && !(choice.to_i <= products.size) # проверяем, что пользователь ввёл цифру, не превышающую кол-во товаров в массиве

  Product.show_all(products)
  puts "Выберите товар или нажмите x"
  choice = STDIN.gets.chomp # если покупатель ввёл некорректный символ, то предлагаем ему выбрать заново цифру

 end

break if choice == "x" # прекращаем цикл, если пользователь ввёл "x"

if choice == "d"
  puts "Какой товар Вы хотите добавить?\n1. Book\n2. Film\n3. Music"
  user_add = STDIN.gets.to_i

    puts "Укажите стоимость продукта в рублях"
    user_cost = STDIN.gets.chomp
    puts "Укажите, сколько ед. продукта осталось на складке"
    user_count = STDIN.gets.chomp
  if user_add == 1
    puts "Укажите автора книги"
    user_author = STDIN.gets.chomp
    puts "Укажите название книги"
    user_title = STDIN.gets.chomp
    Product.add_book(user_cost, user_count, user_title, user_author, 'products.xml')
  elsif user_add == 2
    puts "Укажите название фильма"
    user_title = STDIN.gets.chomp
    puts "Укажите режиссера"
    user_director = STDIN.gets.chomp
    puts "Укажите год создания фильма"
    user_year = STDIN.gets.chomp
    Product.add_film(user_cost, user_count, user_title, user_director, user_year,'products.xml')
  elsif user_add == 3
    puts "Укажите исполнителя"
    user_artist = STDIN.gets.chomp
    puts "Укажите название песни"
    user_album_name = STDIN.gets.chomp
    puts "Укажите жанр"
    user_genre = STDIN.gets.chomp
    Product.add_music(user_cost, user_count, user_album_name, user_artist, user_genre,'products.xml' )
  end
  puts "Товар успешно добавлен"
elsif

  if products[choice.to_i - 1].amount > 0 # условие: если кол-во товара на складе больше нуля,

     user_buy += products[choice.to_i - 1].price # то цену товара записываем в корзину покупателя

  end

  puts products[choice.to_i - 1].buy # отображаем покупателю информацию о купленном им товаре

end
end
if user_buy == 0 # если покупатель покинул магазин и не приобрел ни одного товара, то выводим сообщение
  puts "У вас 0 покупок! Всего доброго. Может быть, в следующий раз Вам удастся что-нибудь подобрать"
else
  puts "Спасибо за покупки! С вас #{user_buy} руб." # если покупатель выбрал товары, то выводим сумму его покупок
end


