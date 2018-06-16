class TeamrefsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_teamref, only: [:destroy]
  before_action :is_writer?, only: [:destroy]
  
  def create
    @teamref = Teamref.new(teamref_params)
    @team = Team.find(params[:teamref][:team_id])
    
    # unless @team.users == current_user # 본인 글에 본인이 댓글 달면 알람 안가게
    #   @new_notification = NewNotification.create! users: @team.users, content: "#{current_user.username}님이 팀 게시판에 새 글을 달았습니다.", link: team_path(@team)
    # end
    
    if @teamref.save
      redirect_to :back
    else
      flash[:alert] = "팀 게시글을 작성할 수 없습니다."
      redirect_to :back
    end
  end

  def destroy
    @teamref.destroy
    redirect_to :back
  end
  
  private
  def set_teamref
    @teamref = Teamref.find(params[:id])
  end
  
  def teamref_params
    params.require(:teamref).permit(:content, :user_id, :team_id)
  end
  
  def is_writer? #destroy
    redirect_to :back unless @teamref.user == current_user
  end
end
