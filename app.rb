require_relative './library/label'
require_relative './library/book'
require_relative './library/game'
require_relative './library/author'
require_relative './library/music_album'
require_relative './library/genre'

class App
  attr_reader :labels, :books, :genres, :music_albums

  def initialize
    @labels = Label.load_all
    @books = Book.load_all
    @genres = Genre.load_all
    @music_albums = MusicAlbum.load_all
    @games = Game.load_all
    @authors = Author.load_all
  end

  def list_labels
    @labels = Label.load_all
    if @labels.empty?
      puts 'There are no labels availabel yet ❌!'
    else
      puts '🏷️ Labels list:'
      @labels.each do |label|
        puts "Title: #{label.title}, " \
             "Color: #{label.color}"
      end
    end
  end

  def list_books
    @books = Book.load_all
    if @books.empty?
      puts 'There are no books availabel yet ❌!'
    else
      puts '📚 Books list:'
      @books.each do |book|
        puts "Title: #{book.title}, " \
             "Publisher: #{book.publisher}, " \
             "Published: #{book.publish_date}, " \
             "Cover_State: #{book.cover_state}, " \
             "Archived: #{book.archived || (book.cover_state == 'bad')}"
      end
    end
  end

  def list_games
    Game.show_list
  end

  def list_authors
    Author.show_list
  end

  def list_all_music_albums
    @music_albums = MusicAlbum.load_all
    if @music_albums.empty?
      puts 'There are no music albums availabel yet ❌!'
    else
      puts '🎶 Music albums list:'
      @music_albums.each do |music_album|
        puts "Title: #{music_album.title}, " \
             "Spotify: #{music_album.on_spotify}, " \
             "Genre: #{music_album.genre}, " \
             "Published: #{music_album.publish_date}, " \
             "Archived: #{music_album.archived}"
      end
    end
  end

  def list_all_genres
    @genres = Genre.load_all
    if @genres.empty?
      puts 'There are no genres availabel yet ❌!'
    else
      puts '📑 Genres list:'
      @genres.each do |genre|
        puts "Genre: #{genre.name}"
      end
    end
  end

  def add_book
    puts 'Enter book title:'
    title = gets.chomp
    puts 'Enter publisher:'
    publisher = gets.chomp
    puts 'Enter cover state (good/bad):'
    cover_state = gets.chomp.downcase == 'bad' ? 'bad' : 'good'
    puts 'Enter publish date (yyyy-mm-dd):'
    publish_date = gets.chomp
    puts 'Enter author:'
    author = gets.chomp
    book = Book.new(title, publisher, publish_date, cover_state)
    book.add_author(author)
    @books = Book.load_all
    @books << book
    puts 'Book has been created successfully! ✅'
    Book.save_all(@books)
  end

  def add_label
    puts 'Enter label title:'
    title = gets.chomp
    puts 'Enter label color:'
    color = gets.chomp
    label = Label.new(title, color)
    @labels = Label.load_all
    @labels << label
    puts 'Label has been created successfully! ✅'
    Label.save_all(@labels)
  end

  def select_author
    puts "\nAdd the author information"
    puts 'First Name: '
    first_name = gets.chomp.to_s
    puts 'Last Name: '
    last_name = gets.chomp.to_s
    Author.new(first_name, last_name)
  end

  def multiplayer_status
    puts 'Multiplayer? (Y/N): '
    multiplayer = gets.chomp
    if %w[Y y].include?(multiplayer)
      true
    elsif %w[N n].include?(multiplayer)
      false
    else
      puts "Invalid value detected: #{mutliplayer}"
    end
  end

  def add_game
    author = select_author
    puts 'Publish Date: '
    publish_date = gets.chomp
    puts 'Select lable '
    label = add_label
    is_multiplayer = multiplayer_status
    puts 'Date last played: '
    last_played = gets.chomp
    new_game = Game.new(publish_date, is_multiplayer, last_played)
    new_game.add_label(label)
    new_game.add_author(author)
    @games = Game.load_all
    @games.push(new_game)
    puts 'Game has been created successfully! ✅'
  end

  def add_genre(name)
    genre = Genre.new(name)
    @genres = Genre.load_all
    @genres << genre
  end

  def add_music_album
    puts 'Enter music album title:'
    title = gets.chomp
    puts 'Enter music album spotify status (true/false):'
    on_spotify = gets.chomp.downcase == 'true'
    puts 'Enter music album publish date (yyyy-mm-dd):'
    publish_date = gets.chomp
    puts 'Enter music album genre name:'
    genre_name = gets.chomp
    genre = @genres.find { |g| g.name == genre_name }
    if genre.nil?
      genre = Genre.new(genre_name)
      @genres << genre
      Genre.save_all(@genres)
    end
    music_album = MusicAlbum.new(title, on_spotify, genre_name, publish_date)
    @music_albums = MusicAlbum.load_all
    @music_albums << music_album
    puts 'Music album has been created successfully ✅'
    MusicAlbum.save_all(@music_albums)
  end

  def close_app
    Label.save_all(@labels)
    Book.save_all(@books)
    Game.save_all
    Author.save_all
    MusicAlbum.save_all(@music_albums)
    Genre.save_all(@genres)
    puts 'Thanks for using the app!'
  end
end
