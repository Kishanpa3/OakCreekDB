class DietsController < ApplicationController
    def diets_params
        params.require(:diet).permit(:instructions, :am, :pm, :dish, :animal_id)
    end

    def create
        @diet = Diet.new(diets_params)
        @diet.animal_id = current_animal.id
    end

end
