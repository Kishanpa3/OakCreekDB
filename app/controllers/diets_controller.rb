class DietsController < ApplicationController
    before_action :set_animal, only: [:index, :show, :edit, :update, :destroy]
    
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
        id = params[:id]
        @diet = Diet.find_or_create_by(animal_id: params[:animal_id])
        
    end

    def update
        @diet = Diet.find_by(animal_id: params[:animal_id])
        @diet.update!(diet_params)
        flash[:notice] = "Diet was successfully updated."
        redirect_to animal_diet_path(@animal)
    end
    
    def destroy
        @diet.destroy
    end
    
    def set_animal
       @animal = Animal.find(params[:animal_id]) 
    end
end
