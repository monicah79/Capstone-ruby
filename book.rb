require_relative 'item'
require 'date'
class Book < Item
  attr_reader :title, :author, :cover_state, :publish_date

  def initialize(title, author, cover_state, publish_date)
    super(title, cover_state) # call superclass constructor with required arguments
    @author = author
    @publish_date = Date.parse(publish_date)
  end

  def can_be_archived?
    (Time.now.year - publish_date.year) >= 10 || cover_state == 'Bad'
  end
end
