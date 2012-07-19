class UsersController < ApplicationController
  def index
    #@users = User.paginate :page=>params[:page], :order=>'created_at desc',:per_page=>2
    @users = User.all
  end
  def new
    @user = User.new
    @token = params[:token]
    @state_signup = StateSignup.where("token_signup = :token",{:token =>@token})
    @user.email = @state_signup[0].email
    if @state_signup[0].active==1
      redirect_to signin_path
    end
  end
  def create
    @user = User.new(params[:user])
    if @user.save
      # Handle a successful save.
      token = params[:token];
      @state_signup = StateSignup.where("token_signup = :token",{:token =>token})
      
      if @state_signup !=nil
        if  @state_signup[0]!=nil
          @state_signup[0].update_attribute(:active,1)
        end
      end 
      @user.update_attribute(:active,1)
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to receivers_path
    else
      render 'new'
    end
  end
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      # Handle a successful update.
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to receivers_path
      #redirect_to @user
    else
      render 'edit'
    end
  end
  before_filter :signed_in_user, only: [:index, :edit, :update]
  #before_filter :correct_user,   only: [:edit, :update]
  #before_filter :admin_user,     only: :destroy
  private
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_path, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end
