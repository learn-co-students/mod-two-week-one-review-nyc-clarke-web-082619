class SeasController < ApplicationController


  def welcome
  end

  def index
    @seas = Sea.all
  end

  def new
    @sea = Sea.new
  end

  def show
    @sea = Sea.find(params[:id])
  end

  def create
    @sea = Sea.create(sea_params)
  end

  def edit
    @sea = Sea.find(params[:id])
  end

  def update
    @sea = Sea.find(params[:id])
    @sea.update(sea_params)
  end

  def delete
    @sea = Sea.find(params[:id])
    @sea.destroy
  end

  private

  def sea_params
    params.require(:sea).permit(:name, :temperature, :bio, :mood, :image_url, :favorite_color, :scariest_creature, :has_mermaids)
  end
  

end
