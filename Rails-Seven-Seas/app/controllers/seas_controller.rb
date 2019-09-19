require_relative "../models/sea.rb"
class SeasController < ApplicationController
 
 #define your controller actions here


  def index
    @seas = Sea.all
  
  end

  def new
    @sea = Sea.new
    
  end

  def show
    @sea = Sea.find(params[:id])

  end

  def edit
    @sea = Sea.find(params[:id])

  end

  def destroy
  Sea.find(params[:id]).destroy
  redirect_to seas_path
  end

  def create 
    # params.require(:sea).permit()
    @sea = Sea.create(params[:sea])
    redirect_to @sea
  end

  def update
    Sea.find(params[:id]).update(params[:sea])
  end


  private
  # In controller actions, use this private method to access sea params from forms.
  # Example: @sea.update(sea_params)
  # check the return value of sea_params to see what you're working with!
  def sea_params
    params.require(:sea).permit(:name, :temperature, :bio, :mood, :image_url, :favorite_color, :scariest_creature, :has_mermaids)
  end

end
