class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user == current_user ? @workbooks = @user.workbooks.all : @workbooks = @user.workbooks.open_all
  end
end
