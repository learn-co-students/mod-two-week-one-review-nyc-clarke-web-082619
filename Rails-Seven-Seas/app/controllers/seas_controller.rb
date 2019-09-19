class SeasController < ApplicationController 

  before_action :find_sea, only:[:show, :destroy, :edit, :update]

  def welcome
    render :welcome
  end

  def index 
    @seas = Sea.all
    render :index
  end

  def new
    @sea = Sea.new(params[:sea])
    render :new
  end

  def create 
    @sea = Sea.create(sea_params)
    redirect_to seas_path
  end

  def edit
    render :edit
  end

  def update
    @sea.update(sea_params)
    redirect_to sea_path
  end

  def show
    render :show
  end

  def destroy
    @sea.destroy
    redirect_to seas_path
  end

  private
  def sea_params
    params.require(:sea).permit(:name, :temperature, :bio, :image_url, :mood, :favorite_color, :scariest_creature, :has_mermaids)
  end

  def find_sea
    @sea = Sea.find_by_id(params[:id])
  end

  end
  