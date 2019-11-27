class DietsController < ApplicationController
  before_action :set_animal, only: [:index, :show, :edit, :update, :destroy]
  # before_action :authenticate_view_permissions, only: [:show, :edit]
  before_action :authenticate_add_permissions, only: [:create, :new]
  before_action :authenticate_edit_permissions, only: [:update, :edit]
  before_action :authenticate_delete_permissions, only: [:destroy]
    
  def diet_params
    params.require(:diet).permit(:instructions, :am, :pm, :dish, :animal_id)
  end
  
  def new
   @diet = Diet.new 
   @diet.animal_id = @animal.id
  end

  def edit
    @diet = Diet.find_by(animal_id: params[:animal_id])
  end

  def create
    @diet = Diet.create(diet_params)
  end
  
  def show
    @diet = Diet.find_or_create_by(animal_id: params[:animal_id])
  end

  def update
    @diet = Diet.find_by(animal_id: params[:animal_id])
    @diet.update!(diet_params)
    flash[:notice] = "Diet was successfully updated."
    redirect_to animal_diet_path(@animal)
  end
  
  def destroy
    @diet = Diet.find_by(animal_id: params[:animal_id])
    @diet.destroy
    flash[:notice] = "Diet for #{@animal.common_name} '#{@animal.name}' deleted."
    redirect_to animal_diet_path(@animal)
  end
  
  def set_animal
    @animal = Animal.find(params[:animal_id]) 
  end
end
