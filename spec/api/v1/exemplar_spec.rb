require 'rails_helper'

describe 'Exemplar API' do
  let(:company) { create(:company) }
  let!(:store) { create(:store, company: company) }
  let!(:store_2) { create(:store, company: company) }
  let(:publisher) { create(:publisher) }
  let(:book) { create(:book, publisher: publisher) }
  let!(:exemplars) { create_list(:exemplar, 3, product: book, store: store) }

  describe 'PATCH /update' do

    context 'with params' do
      before do
        ids = exemplars.map { |e| e.id }
        do_request(ids: ids, exemplar: { status: 'sold', store_id: store_2.id, product_id: 99 })
      end

      it 'updates exemplars list' do
        exemplars.each do |e|
          e.reload
          expect(e.status).to eq 'sold'
          expect(e.store_id).to eq store_2.id
        end
      end

      it 'doesnt update unpermitted params' do
        exemplars.each do |e|
          e.reload
          expect(e.product_id).to eq book.id
        end
      end

      it 'returns 200 status' do
        expect(response).to be_success
      end

      it 'returns updated exemplars' do
        expect(response.body).to have_json_size(3).at_path('exemplars')
      end

      %w(id store_id product_id product_type status).each do |attr|
        it "exemplar contains #{attr}" do
          exemplars.each_with_index do |e,i|
            e.reload
            expect(response.body).to be_json_eql(e.send(attr.to_sym).to_json).at_path("exemplars/#{i}/#{attr}")
          end
        end
      end
    end

    context 'with invalid params' do
      before do
        do_request(ids: [])
      end

      it 'returns 400 status' do
        expect(response).to_not be_success
      end
    end

    def do_request(options = {})
      patch "/api/v1/exemplars", params: { format: :json }.merge(options)
    end
  end
end
