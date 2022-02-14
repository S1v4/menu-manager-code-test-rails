class DishesController < ApplicationController
  def new
  end

  def create
    @dish = Dish.new(dish_params)

    if @dish.save
      redirect_to root_path
    else
      @error = @dish.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def dish_params
    params.require(:dish).permit(:menu_id, :name, :price)
  end
end
