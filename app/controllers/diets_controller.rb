class DietsController < ApplicationController
    def diet_params
        params.require(:diet).permit(:instructions, :am, :pm, :dish, :animal_id)
    end
    
    def new
       @diet = Diet.new 
       @diet.animal_id = @animal.id
    end

    def edit
    end

    def create
        @diet = Diet.new(diet_params)
        @diet.animal_id = @animal.id
        
        if @diet.save
           redirect_to @animal
        else
            #render 'new'
        end
    end

    def update
        @diet.update(diet_params)
    end
    
    def destroy
        @diet.destroy
    end
    
    def set_animal
       @animal = Animal.find(params[:animal_id]) 
    end
end
