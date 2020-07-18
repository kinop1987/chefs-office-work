class MemosController < ApplicationController

  def index
      @memos = current_user.memos
  end

  def show
    @memo = Memo.find_by(id: params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @memo = Memo.new
  end

  def create
    @memo = Memo.create(memo_params)
    redirect_to user_memos_path
  end

  def edit
    @user = User.find(params[:user_id])
    @memo = Memo.find_by(id: params[:id])
  end

  def update
    memo = Memo.find(params[:id])
    memo.update(memo_params)
    redirect_to user_memos_path
  end

  def destroy
    memo = Memo.find(params[:id])
    memo.destroy
    flash[:succes] = 'メッサージを削除しました。'
    redirect_to user_memos_path
  end

  private

  def memo_params
    params.require(:memo).permit(:memo).merge(user_id: current_user.id)
  end

  
end
