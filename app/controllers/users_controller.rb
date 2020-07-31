class UsersController < ApplicationController
 
  def edit
    @user = User.find_by(id: current_user.id)
  end

  def update
    @user = User.find_by(id: current_user.id)
    @user.update(user_params)
    redirect_to root_path, info: "ユーザー情報を編集しました"
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:telephone,:address)
  end
end
