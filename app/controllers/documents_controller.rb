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
    begin
      @document = Document.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "File has already been deleted."
      redirect_back fallback_location: root_path
    rescue StandardError => e
      flash[:alert] = "#{e.message}"
      redirect_back fallback_location: root_path
    end
  end
  
  def destroy
    begin
      @document = Document.find(params[:id])
      @document.destroy
      respond_to do |format|
        format.html { redirect_back fallback_location: root_path }
        format.js
      end
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "File has already been deleted."
      respond_to do |format|
        format.html { redirect_back fallback_location: root_path }
        format.js { render inline: "location.reload();" }
      end
    rescue StandardError => e
      flash[:alert] = "#{e.message}"
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { render :js => "window.location = '#{root_path}'" }
      end
    end
  end
  
  def download
    begin
      @document = Document.find(params[:id])
      remote_file = @document.file.download
      # remote_file.read   #=> "..." 
      send_file remote_file.path, :filename => @document.file.original_filename, :type => @document.file.mime_type
      # remote_file.close!
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "File has already been deleted."
      redirect_back fallback_location: root_path
    rescue StandardError => e
      flash[:alert] = "#{e.message}"
      redirect_back fallback_location: root_path
    end
  end
  
  def serve_uploaded_images
    # @documents = Document.where(animal_id: params[:animal_id]).order(created_at: :desc)
    @images = Document.where("animal_id = ? AND file_data like ?", params[:animal_id], "%\"mime_type\":\"image/%\"%").order(created_at: :desc)
    # @documents.each do |document|
    #   puts document.file_data
    # end
    render json: { html: render_to_string(partial: 'documents/uploaded_images', locals: {:images => @images}) }
  end
 
  private
  
  def set_animal
    begin
      @animal = Animal.find(params[:animal_id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "Animal has already been deleted."
      redirect_to animals_path
    rescue StandardError => e
      flash[:alert] = "#{e.message}"
      redirect_to animals_path
    end
  end
 
  def document_params
    params.require(:document).permit(:file)
  end
end
