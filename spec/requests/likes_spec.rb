require 'rails_helper'

RSpec.describe "Likes API", type: :request do
  # Initialize the test data
  let!(:user) { create(:user) }
  let(:user1) { create(:user) }
  let!(:blog_post) { create(:post, user_id: user.id) }
  let!(:post_like) { create(:like, user_id: user1.id, post_id: blog_post.id) }
  let(:post_id) { blog_post.id }
  let(:headers) { valid_headers }

  # Test suite for POST /posts/:post_id/likes
  describe 'POST /posts/:post_id/likes' do

    context 'when request attributes are valid' do
      before { post "/posts/#{post_id}/likes", params: {}, headers: headers }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/posts/#{post_id}/likes", params: {}, headers: headers }

      it 'returns a failure message' do
        post "/posts/#{post_id}/likes", params: {}, headers: headers
        expect(response.body).to match(/Validation failed: User You have already liked./)
      end
    end
  end

  # Test suite for GET /posts/:post_id/likes
  describe 'GET /posts/:post_id/likes' do
    before { get "/posts/#{post_id}/likes", params: {}, headers: headers }

    context 'when post exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all post likes' do
        expect(parse_response.size).to eq(1)
      end
    end

    context 'when post does not exist' do
      let(:post_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Post/)
      end
    end
  end

  # Test suite for DELETE /posts/:id/unlike
  describe 'DELETE /posts/:id/unlike' do
    before { post "/posts/#{post_id}/likes", params: {}, headers: headers }

    it 'returns status code 204' do
      delete "/posts/#{post_id}/unlike", params: {}, headers: headers
      expect(response).to have_http_status(204)
    end
  end
end
