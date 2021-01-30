class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /Posts
  def index
    @posts = Post.all
    render json: @posts, status: :ok
  end

  # POST /Posts
  def create
    @post = Post.create!(post_params)
    render json: @post, status: :created
  end

  # GET /Posts/:id
  def show
    render json: @post, status: :ok
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