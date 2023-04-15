require_relative '../library/game'
require_relative '../library/author'

describe Game do
  describe '#show_list' do
    it '#show_list: empty' do
      games = Game.instance_variable_set(:@games, [])
      expect { games }.to output('').to_stdout
    end
  end

  describe 'test author basic method' do
    before(:all) do
      @game = Game.new('2000/02/02', false, '2020/02/02')
      @author = Author.new('Abdifatah', 'bakayle')
    end
    it '#initialize' do
      expect(@game.publish_date).to eq '2000/02/02'
      expect(@game.multiplayer).to eq false
      expect(@game.last_played_at).to eq '2020/02/02'
    end

    it '#add_author : of Item' do
      @game.add_author(@author)
      expect(@game.author).to be @author
    end

    it 'Game.all' do
      expect(Game.all).to contain_exactly(@game)
      game2 = Game.new('1999/02/01', false, '2010/02/01')
      expect(Game.all).to contain_exactly(@game, game2)
    end

    it '#archived' do
      @game.move_to_archive
      expect(@game.archived).to eq true
    end
  end

  describe '#add_item' do
    before(:all) do
      @game = Game.new('1999/02/02', false, '2010/02/02')
      @author = Author.new('Abdifatah', 'bakayle')
    end
    it 'author list of item' do
      @author.add_item(@game)
      expect(@author.items).to eq [@game]
    end
  end
end
