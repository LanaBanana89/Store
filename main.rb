if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end


require_relative 'product.rb'
require_relative 'film.rb'
require_relative 'music.rb'
require_relative 'book.rb'

products = []

book = Book.new(150, 0)

book.update(:title => "Алхимик", :name_author => "Пауло Коэльо")

products << book

film = Film.new(200, 50)

film.update(:title => "Убить Билла", :director_name => "Тарантино", :year => 2003)

products << film

music = Music.new(100, 200)

music.update(:album_name => 'Кислород', :artist_name => 'Артем Пивоваров', :genre => 'Pop')

products << music

Product.show_all(products)

puts "Какой товар желаете приобрести?"

choice = STDIN.gets.to_i

while choice != 0 && choice != 1 && choice != 2
  Product.show_all(products)
  puts "Выберите товар"
  choice = STDIN.gets.to_i
end

products[choice].buy

puts "Остаток данного товара: #{products[choice].amount}"

puts "Доход магазина: #{products[choice].revenue}"

