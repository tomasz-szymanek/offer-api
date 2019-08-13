require 'rails_helper'

RSpec.describe 'Offers API', type: :request do
  let!(:users) { create_list(:user, 10) }
  let!(:line_items) { create_list(:line_item, 10) }
  let!(:offers) { create_list(:offer, 10) }
  let(:offer_id) { offers.first.id }

  describe 'GET /offers' do
    before { get '/offers' }

    it 'returns offers' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /offers/:id' do
    before { get "/offers/#{offer_id}" }

    context 'when the record exists' do
      it 'returns the offer' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(offer_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:offer_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Offer/)
      end
    end
  end

  # Test suite for PUT /offers/:id
  describe 'PUT /offers/:id' do
    let!(:line_items) { create_list(:line_item, 10) }
    let(:line_item_id) { line_items.first.id }
    let(:valid_attributes) { { line_item: line_item_id, status: "accepted" } }

    context 'when the record exists' do
      before { put "/offers/#{offer_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end
end