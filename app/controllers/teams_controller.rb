class TeamsController < ApplicationController
  
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :is_writer?, only: [:edit, :update, :destroy]
  
  def index
    @teams = Team.all.order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
  end
  
  def show
    @teamref = Teamref.new
    @teamrefs = @team.teamrefs.order(created_at: :DESC)
  end
  
  def new
    @team = Team.new
  end
  
  def create
    @team = Team.create(team_params)
    
    if @team.save
      redirect_to @team
    else
      flash[:alert] = "게시물을 작성할 수 없습니다."
      render :new
    end
  end

  def edit
  end

  def update
    if @team.update(team_params)
      redirect_to @team
    else
      flash[:alert] = "게시물을 수정할 수 없습니다."
      render :edit
    end
  end

  def destroy
    @team.destroy
    redirect_to teams_path
  end
  
  private
  def set_team
    @team = Team.find(params[:id])
  end
  
  def team_params
    params.require(:team).permit(:user_id, :title, :deadline)
  end
  
  def is_writer? #update/edit/destroy
    redirect_to @team unless @team.user == current_user
  end
  
end
