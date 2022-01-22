class PicsController < ApplicationController
  before_action :find_pic, only: [:edit, :update, :show, :destroy]

  def index
    @pics = Pic.all
  end

  def new
    @pic = Pic.new
  end

  def create
    @pic = Pic.new(pic_params)
    if @pic.save
      redirect_to @pic, notice: "Yess, It was posted!"
    else
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @pic.update(pic_params)
      redirect_to @pic, notice: "Yess, It was updated!"
    else
      render "edit"
    end
  end

  def destroy
    @pic.destroy

    redirect_to root_path
  end

  private

  def pic_params
    params.require(:pic).permit(:tittle, :description)
  end

  def find_pic
    @pic = Pic.find(params[:id])
  end
  
end
