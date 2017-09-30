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

book = Book.new(150, 20)

book.update(:title => "Алхимик", :name_author => "Пауло Коэльо")

puts "Название книги #{book.title} Имя автора #{book.name_author}"

film = Film.new(200, 50)

film.update(:title => "Убить Билла", :director_name => "Тарантино", :year => 2003)

puts "Название фильма #{film.title} Название режиссера #{film.director_name} Год #{film.year}"

music = Music.new(100, 200)

music.update(:album_name => 'Кислород', :artist_name => 'Артем Пивоваров', :genre => 'Pop')

puts "Название песни #{music.album_name} Название исполнителя #{music.artist_name} Жанр #{music.genre}"

