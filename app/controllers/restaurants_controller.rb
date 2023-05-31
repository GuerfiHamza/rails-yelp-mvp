class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    if Restaurant.new(restaurant_params).valid?
      @restaurant = Restaurant.new(restaurant_params)
      @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      @restaurant = Restaurant.new(restaurant_params)
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category, :phone_number)
  end
end
