require 'rails_helper'

RSpec.describe 'posts API', type: :request do
  # initialize test data
  let(:user) { create(:user) }
  let!(:posts) { create_list(:post, 10, user_id: user.id) }
  let(:post_id) { posts.first.id }

  let(:headers) { valid_headers }

  # Test suite for GET /posts
  describe 'GET /posts' do
    # make HTTP get request before each example
    before { get '/posts', params: {}, headers: headers }

    it 'returns posts' do
      expect(parse_response).not_to be_empty
      expect(parse_response.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /posts/:id
  describe 'GET /posts/:id' do
    before { get "/posts/#{post_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the post' do
        expect(parse_response).not_to be_empty
        expect(parse_response['id']).to eq(post_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:post_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Post/)
      end
    end
  end

  # Test suite for POST /posts
  describe 'POST /posts' do
    # valid payload
    let(:valid_attributes) { { title: 'Learn Elm', body: 'test body', user_id: user.id.to_s }.to_json }

    context 'when the request is valid' do
      before { post '/posts', params: valid_attributes, headers: headers }

      it 'creates a post' do
        expect(parse_response['title']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { { title: 'Foobar' }.to_json }
      before { post '/posts', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(parse_response['message'])
          .to match(/Validation failed: Body can't be blank/)
      end
    end
  end

  # Test suite for PUT /posts/:id
  describe 'PUT /posts/:id' do
    let(:valid_attributes) { { title: 'Shopping' }.to_json }

    context 'when the record exists' do
      before { put "/posts/#{post_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /posts/:id
  describe 'DELETE /posts/:id' do
    before { delete "/posts/#{post_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end