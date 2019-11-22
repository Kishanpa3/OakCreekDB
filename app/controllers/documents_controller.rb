class DocumentsController < ApplicationController
  
  before_action :set_animal
  
  def create
    # puts "CREATING DOCUMENT #{@animal.id}"
    # @document = Document.create!(:animal_id => @animal.id, :file_data => document_params[:file])
    # @document = Document.create!(document_params)
  end
  
  def index
    @documents = Document.where(animal_id: params[:animal_id])
    # puts "PARAMS: #{params.keys}"
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
    # puts "DPARAMS: #{params.keys}"
    params.require(:document).permit(:animal_id, :file)
  end
end
