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

products = [] # создаём массив, куда будем загружать товары

book1 = Book.new(150, 0) # создаём объект класса "Book"
book1.update(:title => "Алхимик", :name_author => "Пауло Коэльо") # присваиваем объекту название книги и имя автора
products << book1 # кладём объект в массив товаров

film1 = Film.new(200, 5) # далее наполняем наш массив товарами
film1.update(:title => "Убить Билла", :director_name => "Тарантино", :year => 2003)
products << film1

music = Music.new(100, 200)
music.update(:album_name => 'Кислород', :artist_name => 'Артем Пивоваров', :genre => 'Pop')
products << music

book2 = Book.new(300, 15)
book2.update(:title => "Путешествие в Икстлан", :name_author => "Карлос Кастанеда")
products << book2

film2 = Film.new(250, 27)
film2.update(:title => "Титаник", :director_name => "Джеймс Кэмерон", :year => 1997)
products << film2

user_buy = 0 # Изначально общая стоимость товаров в корзине покупателя "ноль"

loop do # запускаем цикл для выбора покупателем товаров из магазина

Product.show_all(products) # запускаем метод отображения всех товаров магазина

puts "Какой товар желаете приобрести?"

choice = STDIN.gets.chomp # записываем в переменную choice выбор покупаятеля

 while (choice != "x" && choice.to_i == 0) ||  !(choice.to_i =~ /^\d$/) && !(choice.to_i <= products.size) # проверяем, что пользователь ввёл цифру, не превышающую кол-во товаров в массиве

  Product.show_all(products)
  puts "Выберите товар или нажмите x"
  choice = STDIN.gets.chomp # если покупатель ввёл некорректный символ, то предлагаем ему выбрать заново цифру

 end



break if choice == "x" # прекращаем цикл, если пользователь ввёл "x"

if products[choice.to_i - 1].amount > 0 # условие: если кол-во товара на складе больше нуля,

user_buy += products[choice.to_i - 1].price # то цену товара записываем в корзину покупателя

end

puts products[choice.to_i - 1].buy # отображаем покупателю информацию о купленном им товаре

end

if user_buy == 0 # если покупатель покинул магазин и не приобрел ни одного товара, то выводим сообщение
  puts "У вас 0 покупок! Всего доброго. Может быть, в следующий раз Вам удастся что-нибудь подобрать"
else
  puts "Спасибо за покупки! С вас #{user_buy} руб." # если покупатель выбрал товары, то выводим сумму его покупок
end



