require_relative 'item'
require 'date'
class Book < Item
  attr_reader :title, :author, :publish_date, :cover_state

  def initialize(title, author, cover_state, publish_date)
    super(title, author, cover_state, publish_date)
    @title = title
    @author = author
    @cover_state = cover_state
    @publish_date = Date.parse(publish_date)
  end

  def can_be_archived?
    years_since_publication = (Date.today - publish_date).to_i / 365
    years_since_publication > 10 || cover_state.downcase == 'bad'
  end
end
