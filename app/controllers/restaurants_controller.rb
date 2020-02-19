class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[show edit update destoy]

  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(params[:id])
    else
      render :edit
    end
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to root_path
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :rating, :reviews,
                                       :phone_number, :category)
  end
end
