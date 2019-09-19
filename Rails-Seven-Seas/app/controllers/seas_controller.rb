class SeasController < ApplicationController
  #define your controller actions here

  # In controller actions, use this private method to access sea params from forms.
  # Example: @sea.update(sea_params)
  # check the return value of sea_params to see what you're working with!
  def sea_params
    params.require(:sea).permit(:name, :temperature, :bio, :mood, :image_url, :favorite_color, :scariest_creature, :has_mermaids)
  end

  def welcome
    render 'welcome'
  end 

  def new 
    render 'new'
  end

  def create
    Sea.create(sea_params)
    # redirect_to sea_path
  end

  def index 
    @seas = Sea.all
    render 'index'
  end

  def show
    @sea = Sea.find_by(params[:id])
  end

  def edit 
    @sea = Sea.find_by(params[:id])
  end 

  def update
    @sea = Sea.find_by(params[:id])
    @sea.update(sea_params)
    redirect_to sea_path
  end

  def destroy
    @sea = Sea.find(params[:id])
    @sea.destroy
    redirect_to sea_path
  end 

end
