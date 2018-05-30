class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:destroy]
  before_action :is_writer?, only: [:destroy]
  
  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(params[:comment][:post_id])
    
    unless @post.user == current_user # 본인 글에 본인이 댓글 달면 알람 안가게
      @new_notification = NewNotification.create! user: @post.user, content: "#{current_user.email}님이 댓글을 달았습니다.", link: post_path(@post)
    end
    
    if @comment.save
      redirect_to :back
    else
      flash[:alert] = "댓글을 작성할 수 없습니다."
      redirect_to :back
    end
  end

  def destroy
    @comment.destroy
    redirect_to :back
  end
  
  private
  def set_comment
    @comment = Comment.find(params[:id])
  end
  
  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
  
  def is_writer? #destroy
    redirect_to :back unless @comment.user == current_user
  end
  
end
