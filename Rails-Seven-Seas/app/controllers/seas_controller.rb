class SeasController < ApplicationController
  #define your controller actions here

  before_action :find_sea, only: [:show, :edit, :update, :destroy]

  def welcome
    render :welcome
  end

  def index 
    @seas = Sea.all
    render :index 
  end 

  def new
    @sea = Sea.new(params[:sea])
  end 

  def show
    render :show 
  end 

  def create 
    @sea = Sea.create(sea_params) 
    redirect_to seas_path
  end 

  def edit #render form for updating
    render :edit
  end 

  def update #updates form
    redirect_to sea_path
  end 

  def destroy
		@sea.destroy
		redirect_to seas_path
  end


  private
  # In controller actions, use this private method to access sea params from forms.
  # Example: @sea.update(sea_params)
  # check the return value of sea_params to see what you're working with!

  def find_sea
    @sea = Sea.find(params[:id])
  end 

  def sea_params
    params.require(:sea).permit(:name, :temperature, :bio, :mood, :image_url, :favorite_color, :scariest_creature, :has_mermaids)
  end

end
