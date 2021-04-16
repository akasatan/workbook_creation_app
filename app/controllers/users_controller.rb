class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  
  def show
    @user = User.find(params[:id])
    @user == current_user ? @workbooks = @user.workbooks.all.order(id: "DESC") : @workbooks = @user.workbooks.open_all.order(id: "DESC")
  end
  
  def edit
  end
  
  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end
  
  def user_params
    params.require(:user).permit(:introduction)
  end
  
end
