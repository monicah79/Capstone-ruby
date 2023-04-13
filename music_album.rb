require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :genre, :publish_date, :title
end