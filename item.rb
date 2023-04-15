require_relative 'genre'
require 'date'
class Item
  attr_accessor :id, :genre, :author, :source, :label, :publish_date, :archived

  def initialize(id = Random.rand(1..1000), source = nil)
    @id = id
    @genre = Genre
    @author = Author
    @source = source
    @label = Label
    @publish_date = publish_date
    @archived = false
  end

  def can_be_archived?
    years_since_publication = (Date.today - Date.parse(publish_date)).to_i / 365
    years_since_publication > 10 || cover_state == 'Bad'
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
