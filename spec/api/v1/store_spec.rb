require 'rails_helper'

describe 'Store API' do
  let(:company) { create(:company) }
  let!(:store_with_book_1) { create(:store, company: company) }
  let!(:store_with_book_2) { create(:store, company: company) }
  let!(:store_without_book) { create(:store, company: company) }
  let(:publisher) { create(:publisher) }
  let(:book) { create(:book, publisher: publisher) }
  let!(:exemplar_1) { create(:exemplar, product: book, store: store_with_book_1) }
  let!(:exemplar_2) { create(:exemplar, product: book, store: store_with_book_2) }

  describe 'GET /index' do
    context 'without filter params' do
      before do
        do_request
      end

      it 'returns 200 status' do
        expect(response).to be_success
      end

      it 'returns all stores' do
        expect(response.body).to have_json_size(3).at_path('stores')
      end

      %w(id name).each do |attr|
        it "store contains #{attr}" do
          expect(response.body).to be_json_eql(store_with_book_1.send(attr.to_sym).to_json).at_path("stores/0/#{attr}")
          expect(response.body).to be_json_eql(store_with_book_2.send(attr.to_sym).to_json).at_path("stores/1/#{attr}")
          expect(response.body).to be_json_eql(store_without_book.send(attr.to_sym).to_json).at_path("stores/2/#{attr}")
        end
      end
    end

    context 'with filter params' do
      before do
        do_request(filter_type: 'publisher', filter_params: { publisher_id: publisher.id })
      end

      it 'returns 200 status' do
        expect(response).to be_success
      end

      it 'returns filtered stores' do
        expect(response.body).to have_json_size(2).at_path('stores')
      end

      %w(id name).each do |attr|
        it "store contains #{attr}" do
          expect(response.body).to be_json_eql(store_with_book_1.send(attr.to_sym).to_json).at_path("stores/0/#{attr}")
          expect(response.body).to be_json_eql(store_with_book_2.send(attr.to_sym).to_json).at_path("stores/1/#{attr}")
        end
      end
    end

    context 'with invalid filter params' do
      before do
        do_request(filter_type: 'publisher', filter_params: { publisher_id: 100 })
      end

      it 'returns 400 status' do
        expect(response).to_not be_success
      end
    end

    def do_request(options = {})
      get "/api/v1/stores", params: { format: :json }.merge(options)
    end
  end
end
