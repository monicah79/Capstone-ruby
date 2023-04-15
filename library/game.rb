require 'json'
require_relative 'item'
require_relative 'author'

class Game < Item
  attr_accessor :multiplayer, :last_played_at
  attr_reader :id

  def initialize(publish_date, multiplayer, last_played_at)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @id = Random.rand(1..1000)
  end

  def to_s
    "Publish at #{publish_date}, " \
      "Last played at #{last_played_at} " \
      "[multiplayer: #{multiplayer}]"
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def self.show_list
    load_all
    return puts 'There are no games availabel yet ❌!' if all.empty?

    puts '🎮 Games list:'
    all.each_with_index do |game, index|
      puts "#{index}] #{game}"
    end
  end

  def can_be_archived?
    super && (Date.today.year - Date.parse(@last_played_at).year) > 2
  end

  def self.file_path
    './data/games.json'
  end

  def self.save_all
    list = []
    all.each do |game|
      data = { author_id: game.id,
               multiplayer: game.multiplayer,
               last_played_at: game.last_played_at,
               publish_date: game.publish_date }
      list << data
    end
    File.write(file_path, JSON.pretty_generate(list))
    true
  end

  def self.load_all
    return false unless File.exist?(file_path)
    return false if File.empty?(file_path)

    list = JSON.parse(File.read(file_path))
    list.each do |data|
      new(data['publish_date'], data['multiplayer'], data['last_played_at']).instance_variable_set(:@id, data['id'])
    end
  end
end
