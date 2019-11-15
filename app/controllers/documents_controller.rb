class DocumentsController < ApplicationController
  
  before_action :set_animal
  
  def create
    puts "CREATING DOCUMENT + #{@animal.id}"
    # @document = Document.create!(:animal_id => @animal.id, :file_data => document_params[:file])
  end
  
  def index
    @documents = Document.where(animal_id: params[:animal_id])
  end
  
  def show
    id = params[:id]
    @document = Document.find(id)
  end
 
  private
  
  def set_animal
    @animal = Animal.find(params[:animal_id])
  end
 
  def document_params
    params.require(:document).permit(:file)
  end
end
