class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :is_writer?, only: [:edit, :update, :destroy]
  before_action :log_impression, only: [:show]
  
  def index
    @eventcates = Eventcate.all
    
    @posts = Post.all
    if params[:search]
      @posts = Post.search(params[:search]).order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    else
      @posts = Post.all.order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
    end
    
  end

  def new
    @post = Post.new
    cate_params_default
    @post.interestcates.new
  end

  def create
    @post = Post.create(post_params)
    @post.save
    
    num = params["post"]["interestcates_attributes"]["0"]["name"].length
    num.times do |n|
      cate = params["post"]["interestcates_attributes"]["0"]["name"][n]
      c = Interestcate.find_by(name: cate)    
      @post.interestcates << c
    end
    
    if @post.save
      redirect_to @post
    else
      flash[:alert] = "게시물을 작성할 수 없습니다."
      render :new
    end
  end
  
  def show
    @comment = Comment.new
    @comments = @post.comments.order(created_at: :DESC)
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
  
   def cate_params_default
    @icates = []
    @interestcates = Interestcate.all
    @interestcates.each do |c|
      @icates.push(c.name)
    end
  end
  
  def post_params
    params.require(:post).permit(:user_id, :title, :content, :eventdate, :recruitdate, :weblink, :s3_file, :eventcate_id, :interestcates)
  end
  
  def is_writer? #update/edit/destroy
    redirect_to @post unless @post.user == current_user
  end
  
  def log_impression
    @hit_post = Post.find(params[:id])
    @hit_post.impressions.create(ip_address: request.remote_ip, user_id: current_user.id)
  end
  
end
