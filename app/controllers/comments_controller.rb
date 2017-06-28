class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new({
      body: params[:comment][:body]
    
      })

  end

  def edit
  end

  def update
  end

  def destroy
  end
end
