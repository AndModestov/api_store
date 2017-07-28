require 'rails_helper'

RSpec.describe Store, type: :model do
  it { should belong_to :company }
  it { should have_many(:exemplars)}
  it { should validate_presence_of :name }

  describe 'with_books_in_stock scope' do
    let(:company) { create(:company) }
    let(:store_with_book_1) { create(:store, company: company) }
    let(:store_with_book_2) { create(:store, company: company) }
    let!(:store_without_book) { create(:store, company: company) }
    let(:publisher) { create(:publisher) }
    let(:book) { create(:book, publisher: publisher) }
    let!(:exemplar_1) { create(:exemplar, product: book, store: store_with_book_1) }
    let!(:exemplar_2) { create(:exemplar, product: book, store: store_with_book_2) }

    it 'should return stores with book in stock' do
      expect(Store.with_books_in_stock(book.id)).to match_array [store_with_book_1, store_with_book_2]
    end
  end
end
