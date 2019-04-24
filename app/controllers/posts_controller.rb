class PostsController < ApplicationController
before_action :authenticate_user!
before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "Post successfully created"
      redirect_to root_path
    else
      flash[:error] = "Post has error"
      render 'new'
    end  
  end
  
  def show
    @comments = @post.post_comments
  end
  
  def edit
  end
  
  def update
    if @post.update(post_params)
      flash[:notice] = "Post successfully updated"
      redirect_to post_path(@post.id)
    else
      flash[:error] = "Post has error"
      render 'edit'
    end
    
  end
  
  def destroy
    @post.destroy
    redirect_to root_path
  end
  
private

  def post_params
    params.require(:post).permit(:user_id, :title, :body)
  end
  
  def find_post
    @post = Post.find_by(id: params[:id])
  end
end
