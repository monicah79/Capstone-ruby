require 'json'
class List
  attr_accessor :books, :labels

  def initialize
    @books = []
    @labels = []
  end

  def add_book(book)
    @books << book
  end

  def add_label(label)
    @labels << label
  end

  def save_books(filename)
    File.write(filename, JSON.pretty_generate(@books.map(&:to_h)))
  end

  def load_books(filename)
    @books = JSON.parse(File.read(filename)).map do |book_data|
      Book.new(book_data['title'], book_data['author'], book_data['publisher'],
               book_data['cover_state'], book_data['price']).tap do |book|
        book.label = find_label(book_data['label_name']) if book_data['label_name']
      end
    end
  end

  def save_labels(filename)
    File.write(filename, JSON.pretty_generate(@labels.map(&:to_h)))
  end

  def load_labels(filename)
    @labels = JSON.parse(File.read(filename)).map do |label_data|
      Label.new(label_data['name']).tap do |label|
        label_data['items'].each do |item_data|
          item = find_item(item_data['title'])
          label.add_item(item) if item
        end
      end
    end
  end

  private

  def find_label(name)
    @labels.find { |label| label.name == name }
  end

  def find_item(title)
    @books.find { |book| book.title == title }
  end
end
