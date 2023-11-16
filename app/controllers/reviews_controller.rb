class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
  end

  def create
    @review = Review.new(restaurant_params)
    if @review.save!
      redirect_to @review, notice: "Your Restaurant has been created"
    else
      render :new, notice: "You can't create this restaurant"
    end
  end

  def new
    @review = Review.new
  end

  def edit
  end

  def update
    if @review.update(restaurant_params)
      redirect_to @review, notice: "Your Restaurant has been successfully updated."
    else
      render :edit, notice: "Your Restaurant hasn't been updated."
    end
  end

  def destroy
    @review.destroy!
    redirect_to index_path, notice: "Restaurant was successfully destroyed."
  end

  private

  def set_restaurant
    @review = Review.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category, :phone_number)
  end
end
