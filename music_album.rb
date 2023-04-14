require_relative 'item'

class MusicAlbum < Item
  attr_reader :on_spotify

  def initialize(id, publish_date, on_spotify)
    super(id, publish_date)
    @on_spotify = on_spotify
  end
  
  def can_be_archived?
    super && @on_spotify
  end
end
