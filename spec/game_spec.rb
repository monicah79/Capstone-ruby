require_relative '../game'

RSpec.describe Game do
    describe '#initialize' do
        let(:game) { Game.new('Super Mario', true, '2020/10/10', '1990/10/10') }

        it 'should set an id' do
            expect(game.id).to_not be_nil
        end

        it 'should set the title' do
            expect(game.title).to eq('Super Mario')
        end

        it 'should set the multiplayer' do
            expect(game.multiplayer).to eq(true)
        end

        it 'should set the last played at' do
            expect(game.last_played_at).to eq('2020/10/10')
        end

        it 'should set the publish date' do
            expect(game.publish_date).to eq('1990/10/10')
        end

        it 'should set an empty array for authors' do
            expect(game.authors).to be_empty
        end
    end
  
