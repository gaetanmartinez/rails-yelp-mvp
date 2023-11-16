class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[show edit update destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save!
      redirect_to @restaurant, notice: "Your Restaurant has been created"
    else
      render :new, notice: "You can't create this restaurant"
    end
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant, notice: "Your Restaurant has been successfully updated."
    else
      render :edit, notice: "Your Restaurant hasn't been updated."
    end
  end

  def destroy
    @restaurant.destroy!
    redirect_to restaurants_path, notice: "Restaurant was successfully destroyed."
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category, :phone_number)
  end
end
