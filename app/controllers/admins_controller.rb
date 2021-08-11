class AdminsController < ApplicationController
  def index
      @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = current_admin.build_user(user_params)
    
    if @user.save
      @user.confirm
      redirect_to "/admins"
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to "/admins"
    else
      render :edit
    end
  end

  def pending_show
    @users = User.where(approved: false)
  end

  def pending_approve
    @user = User.find_by_id_and_approved!(params[:id], false)
    @user.approved = true
    @user.update(:id => @user.id)
    AdminMailer.confirmation_approval(@user).deliver
    redirect_to admin_pending_show_url
  end


  def create_new_user
    @user = User.new(user_params)
    # @user.save
    if @user.save
      redirect_to "/admins"
    else
      render :new
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :admin, :approved, :confirmed_at)
    end
end