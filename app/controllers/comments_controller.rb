class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end
  def new
    @comment = Comment.new(post_id: params[:post_id])
  end

  def create

    @comment = Comment.new(comment_params)
    @comment.user = current_user.name
    if @post.save
      redirect_to post_path(@post)
    else
      redirect_to new_comment_path
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.body = params[:comment][:id]
    @comment.save

    redirect_to post_path(@post)
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
end
