class MenusController < ApplicationController
  def index
    render json: Menu.all, only: [:id, :name], include: { dishes: { only: [:id, :name, :price]} }, status: :ok
  end

  def new
  end

  def create
    @menu = Menu.new(menu_params)
    @menu.restaurant_id = current_restaurant_id

    if @menu.save
      redirect_to root_path
    else
      @error = @menu.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def menu_params
    params.require(:menu).permit(:name)
  end
end
