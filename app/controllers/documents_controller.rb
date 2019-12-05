class DocumentsController < ApplicationController
  
  before_action :set_animal
  
  def create
    # puts "CREATING DOCUMENT #{@animal.id}"
    # @document = Document.create!(:animal_id => @animal.id, :file_data => document_params[:file])
    # @document = Document.create!(:animal_id => @animal.id, document_params)
  end
  
  def index
    # @documents = Document.where(animal_id: params[:animal_id]).order(created_at: :desc)
    # Note: will_paginate not consistent with list.js - list.js can only filter current page
    @documents = Document.where(animal_id: params[:animal_id]).paginate(page: params[:page], per_page: 1000).order(created_at: :desc)
    @custom_paginate_renderer = custom_paginate_renderer
  end
  
  def show
    id = params[:id]
    @document = Document.find(id)
  end
  
  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    respond_to do |format|
      format.html { redirect_to animal_documents_path }
      format.js
    end
    # redirect_to animal_documents_path
  end
  
  def download
    @document = Document.find(params[:id])
    remote_file = @document.file.download
    # remote_file.read   #=> "..." 
    send_file remote_file.path, :filename => @document.file.original_filename, :type => @document.file.mime_type
    # remote_file.close!
  end
 
  private
  
  def set_animal
    @animal = Animal.find(params[:animal_id])
  end
 
  def document_params
    params.require(:document).permit(:file)
  end
end
