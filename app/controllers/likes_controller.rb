class LikesController < ApplicationController
  before_action :set_post

  # GET /posts/:post_id/likes
  def index
    json_response(@post.likes.paginate(page: params[:page], per_page: 20), :ok)
  end

  # POST /posts/:post_id/likes
  def create
    @like = @post.likes.create!(user_id: current_user.id)
    json_response(@like, :created)
  end

  # DELETE /posts/:post_id/unlike
  def destroy
    @like = @post.likes.find_by!(user_id: current_user.id) if @post
    @like.destroy
    head :no_content
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

end
