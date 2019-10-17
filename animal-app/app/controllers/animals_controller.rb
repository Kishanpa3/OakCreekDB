class AnimalsController < ApplicationController
  def animals_params
    params.require(:animal).permit(:exhibit, :commonName)
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
