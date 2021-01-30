class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /Posts
  def index
    @posts = current_user.posts
    json_response(@posts)
  end

  # POST /Posts
  def create
    @post = current_user.posts.create!(post_params)
    json_response(@post, :created)
  end

  # GET /Posts/:id
  def show
    json_response(@post, :ok)
  end

  # PUT /Posts/:id
  def update
    @post.update(post_params)
    head :no_content
  end

  # DELETE /Posts/:id
  def destroy
    @post.destroy
    head :no_content
  end

  private

  def post_params
    # whitelist params
    params.permit(:title, :body)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end