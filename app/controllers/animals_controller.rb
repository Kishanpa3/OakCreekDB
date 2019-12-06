class AnimalsController < ApplicationController
  # before_action :authenticate_view_permissions, only: [:show, :edit]
  before_action :authenticate_add_permissions, only: [:create, :new]
  before_action :authenticate_edit_permissions, only: [:update, :edit]
  before_action :authenticate_delete_permissions, only: [:destroy]
  
  before_action :authenticate_animal_image, only: [:update_image]
  
  
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
    @animal = Animal.create!(animal_params)
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
      respond_to do |format|
        format.html { redirect_to animal_documents_path(@animal) }
        format.js
      end
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
  
  def update_image
    profile_image = AnimalProfileImage.where(animal_id: params[:animal_id]).first_or_initialize
    profile_image.document_id = params[:image_id]
    profile_image.save
    puts 'CREATED ANIMAL PROFILE IMAGE'
  end
  
  private
  
  def animal_params
    params.require(:animal).permit(:habitat_num, :common_name, :dob, :name, :tag, :neutered, :species, :sex, :age, :weight, :documents_attributes => {})
    # params.require(:animal).permit!
  end
  
  def authenticate_animal_image
    params.require([:animal_id, :image_id]);
  end
end
