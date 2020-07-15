class CarendersController < ApplicationController

  def index
    @carenders = Carender.all
  end

  def new
    @carender = Carender.new
  end

  def show
    @carender = Carender.find(params[:id])
  end

  def create
    Carender.create(carender_parameter)
  end

  def destroy
    @carender = Carender.find(params[:id])
    @carender.destroy
  end

  def edit
    @carender = Carender.find(params[:id])
  end

  def update
    @carender = Carender.find(params[:id])
    if @carender.update(carender_parameter)
    else
      render 'edit'
    end
  end

  private

  def carender_parameter
    params.require(:carender).permit(:user_id, :start_time)
  end

    
end

