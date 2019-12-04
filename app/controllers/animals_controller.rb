class AnimalsController < ApplicationController
  # before_action :authenticate_view_permissions, only: [:show, :edit]
  before_action :authenticate_add_permissions, only: [:create, :new]
  before_action :authenticate_edit_permissions, only: [:update, :edit]
  before_action :authenticate_delete_permissions, only: [:destroy]
  
  
  def index
    @animals = Animal.all
    @allAnimals = @animals.joins(:diet)
    respond_to do |format|
      format.html
      format.json { render json: AnimalDatatable.new(view_context) }
      format.csv { send_data @allAnimals.toCSV }
    end
  end

  def show
    id=params[:id]
    @animal = Animal.find(id)
  end
  
  def new
    # default: render 'new' template
  end
  
  def create
    @animal = Animal.create!(animals_params)
    @animal.diet = Diet.create!(animal_id: @animal.id)
    flash[:notice] = "#{@animal.tag} was successfully created."
    redirect_to animals_path
  end

  def edit
    @animal = Animal.find params[:id]
  end
  
  def update
    @animal = Animal.find params[:id]
    @animal.update!(animal_params)
    # puts "ANIMAL PARAMS: #{animal_params.keys}"
    # puts "DOC ATR: #{animal_params[:documents_attributes]}"
    if (animal_params.key?(:documents_attributes))
    else
      flash[:notice] = "#{@animal.tag} was successfully updated."
      redirect_to animal_path(@animal)
    end
  end
  
  def destroy
    @animal = Animal.find(params[:id])
    @animal.destroy
    flash[:notice] = "Entry for #{@animal.common_name} '#{@animal.name}' successfully deleted."
    redirect_to animals_path
  end
  
  private
  
  def animal_params
    params.require(:animal).permit(:habitat_num, :common_name, :dob, :name, :tag, :neutered, :species, :sex, :age, :weight, :documents_attributes => {})
    # params.require(:animal).permit!
  end
end
