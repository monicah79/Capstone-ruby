require 'json'
require 'date'
require_relative 'item'

class Book < Item
  attr_accessor :title, :publisher, :cover_state

  def initialize(title, publisher, publish_date, cover_state)
    super(publish_date)
    @title = title
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  def self.file_path
    './data/books.json'
  end

  def self.load_all
    return [] unless File.exist?(file_path)

    file = File.read(file_path)
    data = JSON.parse(file)
    data.map { |book_data| Book.new(*book_data.values) }
  end

  def self.save_all(books)
    data = books.map do |book|
      {
        title: book.title,
        publisher: book.publisher,
        publish_date: book.publish_date,
        cover_state: book.cover_state
      }
    end
    File.write(file_path, JSON.pretty_generate(data))
  end
end
