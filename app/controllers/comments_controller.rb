class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end


  def new
    @comment = Comment.new(post_id: params[:post_id])
  end

  def create
    @post = Post.find(params[:id])
    @post.comments.create({
      body: params[:comment][:body],
      user_id: session[:user_id],
      post_id: @post.id
    })

    redirect_to post_path(@post)
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

  end

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

      if @comment.update(comments_params)
        redirect_to post_path(@post)
      else
        render 'edit'
      end
    end

  def destroy

    @comment = Comment.find(params[:id])
    @post = @comment.post
    @comment.destroy

    redirect_to post_path(@post)
  end

  private
  def comments_params
    params.require(:comment).permit(:body)
  end
end
