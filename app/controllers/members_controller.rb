class MembersController < ApplicationController
  def create
    @member = Member.new
    @member.user_id = User.find_by(username: params[:member][:username]).id
    @member.team_id = params[:member][:team_id]
    @member.username = params[:member][:username]
    @member.workname = params[:member][:workname]
    
    if @member.save
      redirect_to :back
    else
      flash[:alert] = "멤버를 추가할 수 없습니다."
      redirect_to :back
    end
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to :back
  end
end
