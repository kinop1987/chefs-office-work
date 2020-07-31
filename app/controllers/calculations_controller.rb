class CalculationsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @calculation = Calculation.new
    @cost = @user.receipts.where('extract(month from delivery_time) = ?', Time.now.month).sum(:total_price)
    
  end

  def create 
    @calculation = Calculation.new(calculation_params)
    if @calculation.save
      redirect_to user_calculations_path
    end
  end 

  def update
    @calculation = Calculation.find_by(id: params[:id])
    @calculation.update(calculation_params)
    if @calculation.save
      redirect_to user_calculations_path
    end
  end

  private
   def calculation_params
    params.require(:calculation).permit(:income, :last_invent, :this_invent, :cost, :cost_rate).merge(user_id: current_user.id)
   end
  
end
