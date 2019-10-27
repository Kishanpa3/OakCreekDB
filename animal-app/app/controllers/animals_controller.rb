class AnimalsController < ApplicationController
  def animals_params
    params.require(:animal).permit(:habitat_num, :common_name)
  end
  
  def index
    respond_to do |format|
      format.html
      format.json { render json: AnimalDatatable.new(view_context) }
    end
    # @animals = Animal.all
  end

  def show
    id = params[:id]
    @animal = Animal.find(id)
  end

  def new
  end

  def edit
  end
  
  def get_dataset
    
  end
end
