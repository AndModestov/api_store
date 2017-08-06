require 'rails_helper'

RSpec.describe Store, type: :model do
  it { should belong_to :company }
  it { should have_many(:exemplars)}
  it { should validate_presence_of :name }

  let(:company) { create(:company) }
  let(:store_with_book_1) { create(:store, company: company) }
  let(:store_with_book_2) { create(:store, company: company) }
  let!(:store_without_book) { create(:store, company: company) }
  let(:publisher) { create(:publisher) }
  let(:book) { create(:book, publisher: publisher) }
  let!(:exemplar_1) { create(:exemplar, product: book, store: store_with_book_1) }
  let!(:exemplar_2) { create(:exemplar, product: book, store: store_with_book_2) }

  describe 'with_books_in_stock scope' do
    it 'should return stores with book in stock' do
      expect(Store.with_books_in_stock(book.id)).to match_array [store_with_book_1, store_with_book_2]
    end
  end

  describe 'filter_by method' do

    context 'filter by publisher' do
      context 'with valid publisher id' do
        after { Store.filter_by 'publisher', { publisher_id: publisher.id } }

        it 'should call right filter method' do
          expect(Store).to receive(:filter_by_publisher).with({ publisher_id: publisher.id })
        end

        it 'should call the right scope' do
          expect(Store).to receive(:with_books_in_stock).with(publisher.books.ids)
        end
      end

      context 'with invalid publisher id' do
        it 'should return nil' do
          stores = Store.filter_by('publisher', { publisher_id: 100500 })
          expect(stores).to eq nil
        end
      end
    end

    context 'with invalid filter params' do
      it 'should return nil' do
        stores = Store.filter_by('abc')
        expect(stores).to eq nil
      end
    end
  end

end
