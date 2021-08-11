class AdminsController < ApplicationController
  def index
      @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
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
      redirect_to admin_path
    else
      render :new
    end
  end

  private
    def user_params
      params.permit(:user).permit(:name, :email, :password, :admin, :approved, :confirmed_at)
    end
end