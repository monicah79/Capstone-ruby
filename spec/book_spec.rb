require_relative '../book'

describe Book do
  describe '#can_be_archived?' do
    context 'when the publish date is more than 10 years ago' do
      let(:book) { Book.new('Title', 'Publisher', 'Good', '2010-03-28') }

      it 'returns true' do
        expect(book.can_be_archived?).to be_truthy
      end
    end

    context 'when the cover state is bad' do
      let(:book) { Book.new('Title', 'Publisher', 'Bad', '2020-03-28') }

      it 'returns true' do
        expect(book.can_be_archived?).to be_truthy
      end
    end

    context 'when neither of the above is true' do
      let(:book) { Book.new('Title', 'Publisher', 'Good', '2022-03-28') }

      it 'returns false' do
        expect(book.can_be_archived?).to be_falsey
      end
    end
  end
end
