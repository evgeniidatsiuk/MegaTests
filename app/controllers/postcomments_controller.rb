class PostcommentsController < ApplicationController
before_action :authenticate_user!
before_action :set_post

  def new
    @comment = PostComment.new
  end
  
  def create
    params[:post_comment][:user_id] = current_user.id
    params[:post_comment][:post_id] = @post.id
    @comment = PostComment.new(comment_params)
    if @comment.save
      redirect_to post_path(@post.id)
    else
      render 'new'
    end
    
  end
  
  def show
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
private
  def set_post
    @post = Post.find_by(id: params[:post_id])
  end
  
  def comment_params
    params.require(:post_comment).permit(:user_id, :post_id, :body)
  end
end
