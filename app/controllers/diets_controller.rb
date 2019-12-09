class DietsController < ApplicationController
  before_action :set_animal #, only: [:index, :show, :edit, :update, :destroy]
  # before_action :authenticate_view_permissions, only: [:show, :edit]
  before_action :authenticate_add_permissions, only: [:create, :new]
  before_action :authenticate_edit_permissions, only: [:update, :edit]
  before_action :authenticate_delete_permissions, only: [:destroy]
  
  def new
    # default: render 'new' template
  end

  def edit
    @diet = Diet.find_by(animal_id: params[:animal_id])
  end

  def create
    @diet = Diet.new(diet_params)
    if @diet.valid?
      @diet.save
      redirect_to animal_diet_path(@animal)
    else
      render :new
    end
  end
  
  def show
    @diet = Diet.find_or_create_by(animal_id: params[:animal_id])
  end

  def update
    @diet = Diet.find_by(animal_id: params[:animal_id])
    @diet.assign_attributes(diet_params)

    if @diet.valid?
      @diet.save
      flash[:notice] = "#{@animal.name}'s diet was successfully updated."
      redirect_to animal_diet_path(@animal)
    else
      flash[:alert] = "Failed to update #{@animal.name}'s diet."
      render :edit
    end
  end
  
  def destroy
    @diet = Diet.find_by(animal_id: params[:animal_id])
    @diet.destroy
    # flash[:notice] = "Diet for #{@animal.name} was successfully deleted."
    redirect_to animal_diet_path(@animal)
  end
  
  private
  
  def set_animal
    @animal = Animal.find(params[:animal_id])
  end
  
  def diet_params
    params.require(:diet).permit(:instructions, :am, :pm, :dish, :animal_id)
  end
end
