class AnimalsController < ApplicationController
  def animals_params
    params.require(:animal).permit(:habitat_num, :common_name)
  end
  
  def index
    @animals = Animal.all
  end

  def show
    id = params[:id]
    @animal = Animal.find(id)
  end

  def new
  end

  def edit
  end
end
