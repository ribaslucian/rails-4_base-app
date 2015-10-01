

class Users::UsersController < ApplicationController

  def index
    @users = User.paginate(:page => params[:page], :per_page => 10).order(:id)
  end
  
  def new
    @user = User.new
  end

  def show
    @user = User.find params[:id]
  end
  
  def edit
    @user = User.find params[:id]
  end
  
  def create
    @user = User.new user_params
      
    if @user.save
      flash[:success] = 'Usuário criado com sucesso.'
      redirect_to user_path(@user)
    else
      render :action => 'new'
    end
  end
  
  def update
    @user = User.find params[:id]
    
    if @user.update_attributes(user_params)
      flash[:success] = 'Edição efetuada com sucesso.'
      redirect_to user_path(@user)
    else
      render :action => 'edit'  
    end
  end
  
  def destroy
    flash[:success] = 'Deletação efetuada com sucesso.'
    (User.find params[:id]).destroy
    redirect_to users_users_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(:avatar, :name, :email, :pass, :pass_confirmation)
  end

end