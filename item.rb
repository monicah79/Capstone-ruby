class Item
  attr_accessor :publish_date, :cover_state

  def initialize(publish_date, cover_state)
    @publish_date = publish_date
    @cover_state = cover_state
  end

  def can_be_archived?
    if @publish_date < (Time.now - 10.years).to_date
      true
    else
      @cover_state == 'bad'
    end
  end

  def add_author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def add_label=(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

  def add_genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end
end
