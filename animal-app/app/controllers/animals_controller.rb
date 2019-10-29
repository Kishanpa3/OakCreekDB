class AnimalsController < ApplicationController
  def animals_params
    params.require(:animal).permit(:tag)
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
    # default: render 'new' template
  end
  
  def create
    @animal = Animal.create!(animals_params)
    flash[:notice] = "#{@animal.tag} was successfully created."
    redirect_to animals_path
  end

  def edit
    @animal = Animal.find params[:id]
  end
  
  def update
    @animal = Animal.find params[:id]
    @animal.update_attributes!(animals_params)
    flash[:notice] = "#{@animal.tag} was successfully updated."
    redirect_to animal_path(@animal)
  end
  
  def destroy
    @animal = Animal.find(params[:id])
    @animal.destroy
    flash[:notice] = "Entry for #{@animal.common_name} '#{@animal.name}' deleted."
    redirect_to animals_path
  end
end
