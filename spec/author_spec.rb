require 'date'
require_relative '../library/author'

describe Author do
  let(:author) { Author.new('Abdifatah', 'bakayle') }
  let(:game) { double('game') }

  describe '#initialize' do
    it 'should set an id' do
      expect(author.id).to_not be_nil
    end

    it 'should set the first name' do
      expect(author.first_name).to eq('Abdifatah')
    end

    it 'should set the last name' do
      expect(author.last_name).to eq('bakayle')
    end

    it 'should set an empty array for items' do
      expect(author.items).to be_empty
    end
  end

  describe '#show_list' do
    it '#show_list: empty' do
      authors = Author.instance_variable_set(:@authors, [])
      expect { puts authors }.to output('').to_stdout
    end
  end
end
