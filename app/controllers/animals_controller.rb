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
    @animal = Animal.find(params[:id])
  end
  
  def new
    # default: render 'new' template
  end
  
  def create
    @animal = Animal.new(animal_params)
    if @animal.valid?
      @animal.save
      @animal.diet = Diet.create(animal_id: @animal.id)
      flash[:notice] = "Entry for #{@animal.tag} '#{@animal.name}' was successfully created."
      redirect_to animals_path
      # redirect_to animal_path(@animal)
    else
      flash[:alert] = "Failed to create new animal."
      render :new
    end
  end

  def edit
    @animal = Animal.find(params[:id])
  end
  
  def update
    # @animal = Animal.find(params[:id])
    # @animal.update!(animal_params)
    
    # if (animal_params.key?(:documents_attributes))
    #   respond_to do |format|
    #     format.html { redirect_back fallback_location: root_path }
    #     format.js
    #   end
    # else
    #   flash[:notice] = "#{@animal.name} was successfully updated."
    #   redirect_to animal_path(@animal)
    # end
    
    # puts "ANIMAL PARAMS: #{animal_params.keys}"
    # puts "DOC ATR: #{animal_params[:documents_attributes]}"
    @animal = Animal.find(params[:id])
    @animal.assign_attributes(animal_params)
    
    if @animal.valid?
      @animal.save
      if (animal_params.key?(:documents_attributes))
        respond_to do |format|
          format.html { redirect_back fallback_location: root_path }
          format.js
        end
      else
        flash[:notice] = "#{@animal.name} was successfully updated."
        redirect_to animal_path(@animal)
      end
    else
      if (animal_params.key?(:documents_attributes))
        respond_to do |format|
          format.html { redirect_back fallback_location: root_path }
          format.js
        end
      else
        flash[:alert] = "Failed to update #{@animal.name}."
        render :edit
      end
    end
  end
  
  def destroy
    begin
      @animal = Animal.find(params[:id])
      @animal.destroy
      flash[:notice] = "Entry for #{@animal.tag} '#{@animal.name}' was successfully deleted."
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "Animal has already been deleted."
    rescue StandardError => e
      flash[:alert] = "#{e.message}"
    ensure
      redirect_to animals_path
    end
  end
  
  def update_image
    profile_image = AnimalProfileImage.where(animal_id: params[:animal_id]).first_or_initialize
    profile_image.document_id = params[:image_id]
    profile_image.save
  end
  
  private
  
  def authenticate_animal_image
    params.require([:animal_id, :image_id]);
  end
  
  def animal_params
    params.require(:animal).permit(:habitat_num, :common_name, :dob, :name, :tag, :neutered, :species, :sex, :weight, :weight_units, :notes, :documents_attributes => {})
    # params.require(:animal).permit!
  end
end
