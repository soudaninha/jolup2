class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update]
  before_action :is_writer?, only: [:edit, :update]

  def new
    @profile= Profile.find_or_create_by(user_id: current_user.id)
    
    cate_params_default
    @profile.interestcates.new
    @profile.eventcates.new
    @profile.workcates.new
    @profile.profcates.new
    
  end
  
  def create
    @profile= Profile.find_by(user_id: current_user.id)
    
    cate_params_default
    
    if @profile.update(profile_params)
      @user = current_user
      @user.profilecomplete = true
      @user.save
      
      redirect_to @profile
    else
      flash[:alert] = "프로필을 작성할 수 없습니다."
      render :new
    end
  end

  def edit
  end

  def update
    cate_params
    
    if @profile.update(profile_params)
      @user = current_user
      @user.profilecomplete = true
      @user.save
      
      redirect_to @profile
    else
      flash[:alert] = "프로필을 저장할 수 없습니다."
      render :edit
    end
  end

  def show
  end
  
  private
  def set_profile
    @profile = Profile.find(params[:id])
  end
  
  def profile_params
    params.require(:profile).permit(:user_id, :birthdate, :phone, :sex, :name, :eventnum, :introduce, :webpage)
  end
  
  def is_writer? #update/edit
    redirect_to @profile unless @profile.user == current_user
  end
  
  def cate_params_default
    @icates = []
    @ecates = []
    @wcates = []
    @pcates = []
    
    @interestcates = Interestcate.all
    @eventcates = Eventcate.all
    @workcates = Workcate.all
    @profcates = Profcate.all

    @interestcates.each do |c|
      @icates.push(c.name)
    end
    @eventcates.each do |c|
      @ecates.push(c.name)
    end
    @workcates.each do |c|
      @wcates.push(c.name)
    end
    @profcates.each do |c|
      @pcates.push(c.name)
    end
  end
  
  def cate_params
    num = params["profile"]["interestcates_attributes"]["0"]["name"].length
    num.times do |n|
      cate = params["profile"]["interestcates_attributes"]["0"]["name"][n]
      c = Interestcate.find_by(name: cate)    
      @profile.interestcates << c
    end
    
    num = params["profile"]["eventcates_attributes"]["0"]["name"].length
    num.times do |n|
      cate = params["profile"]["eventcates_attributes"]["0"]["name"][n]
      c = Eventcate.find_by(name: cate)    
      @profile.eventcates << c
    end
    
    num = params["profile"]["workcates_attributes"]["0"]["name"].length
    num.times do |n|
      cate = params["profile"]["workcates_attributes"]["0"]["name"][n]
      c = Workcate.find_by(name: cate)    
      @profile.workcates << c
    end
    
    num = params["profile"]["profcates_attributes"]["0"]["name"].length
    num.times do |n|
      cate = params["profile"]["profcates_attributes"]["0"]["name"][n]
      c = Profcate.find_by(name: cate)    
      @profile.profcates << c
    end
  end
  
end
