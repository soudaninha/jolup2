class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :is_writer?, only: [:edit, :update, :destroy]
  
  def index
    @posts = Post.order(created_at: :DESC) # 최신글 먼저
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      flash[:alert] = "게시물을 작성할 수 없습니다."
      render :new
    end
  end
  
  def show
    @comment = Comment.new
    @comments = @post.comments
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      flash[:alert] = "게시물을 수정할 수 없습니다."
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end
  
  #리팩터링
  private
  def set_post
    @post = Post.find(params[:id])
  end
  
  def post_params
    params.require(:post).permit(:user_id, :title, :content, :eventdate, :recruitdate, :weblink)
  end
  
  def is_writer? #update/edit/destroy
    redirect_to @post unless @post.user == current_user
  end
  
end
