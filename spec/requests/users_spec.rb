require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let(:user) { build(:user) }
  let(:existing_user) { create(:user) }
  let(:headers) { valid_headers.except('Authorization') }
  let(:valid_attributes) do
    attributes_for(:user, password_confirmation: user.password)
  end
  let(:invalid_email_request) do
    attributes_for(:user, email: 'test')
  end

  let(:same_email_request) do
    attributes_for(:user, email: existing_user.email)
  end

  # User signup test suite
  describe 'POST /signup' do
    context 'when valid request' do
      before { post '/signup', params: valid_attributes.to_json, headers: headers }

      it 'creates a new user' do
        expect(response).to have_http_status(201)
      end

      it 'returns success message' do
        expect(parse_response['message']).to match(/Account created successfully/)
      end

      it 'returns an authentication token' do
        expect(parse_response['auth_token']).not_to be_nil
      end
    end

    context 'when invalid request' do
      before { post '/signup', params: {}, headers: headers }

      it 'does not create a new user' do
        expect(response).to have_http_status(422)
      end

      it 'returns failure message' do
        expect(parse_response['message'])
          .to match(/Validation failed: Password can't be blank, Name can't be blank, Email can't be blank, Password digest can't be blank/)
      end
    end

    context 'when invalid email' do
      before { post '/signup', params: invalid_email_request.to_json, headers: headers }

      it 'does not create a new user' do
        expect(response).to have_http_status(422)
      end

      it 'returns failure message' do
        expect(parse_response['message'])
          .to match(/Validation failed: Email is invalid/)
      end
    end

    context 'when already existing email passed' do
      before { post '/signup', params: same_email_request.to_json, headers: headers }

      it 'does not create new user' do
        expect(response).to have_http_status(422)
      end

      it 'returns failure message' do
        expect(parse_response['message'])
          .to match(/Validation failed: Email has already been taken/)
      end
    end
  end
end