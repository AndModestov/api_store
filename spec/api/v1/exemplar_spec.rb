require 'rails_helper'

describe 'Exemplar API' do
  let(:company) { create(:company) }
  let!(:store) { create(:store, company: company) }
  let(:publisher) { create(:publisher) }
  let(:book) { create(:book, publisher: publisher) }
  let!(:exemplars) { create_list(:exemplar, 3, product: book, store: store) }

  describe 'PATCH /sell' do

    context 'with params' do
      before do
        ids = exemplars.map { |e| e.id }
        do_request(ids: ids)
      end

      it 'returns 200 status' do
        expect(response).to be_success
      end

      it 'returns sold exemplars' do
        expect(response.body).to have_json_size(3).at_path('exemplars')
      end

      %w(id store_id product_id product_type).each do |attr|
        it "exemplar contains #{attr}" do
          exemplars.each_with_index do |e,i|
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
      patch "/api/v1/exemplars/sell", params: { format: :json }.merge(options)
    end
  end
end
