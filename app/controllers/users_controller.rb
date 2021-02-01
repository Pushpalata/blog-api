class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create

  # POST /signup
  # return authenticated token upon signup
  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.email, user.password).call
    response = { message: Message.account_created, auth_token: auth_token }
    json_response(response, :created)
  end

  def my_posts
    json_response(current_user.posts.paginate(page: params[:page], per_page: 20), :ok)
  end

  def my_comments
    json_response(current_user.comments.paginate(page: params[:page], per_page: 20), :ok)
  end

  private

  def user_params
    params.permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end
end