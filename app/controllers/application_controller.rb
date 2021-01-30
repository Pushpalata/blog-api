class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  # called before every action on controllers
  before_action :authorize_request
  attr_reader :current_user

  rescue_from ActiveRecord::RecordNotFound do |e|
		render json: { message: e.message }, status: :not_found
	end

	rescue_from ActiveRecord::RecordInvalid do |e|
		render json: { message: e.message }, status: :unprocessable_entity
	end

  private

  # Check for valid request token and return user
  def authorize_request
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
  end
end
