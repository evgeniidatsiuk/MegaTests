class PhotosController < ApplicationController
before_action :authenticate_user!, except: [:index]
  
  def index
  	@photos = Photo.all
  end

  def new
  	@photo = Photo.new
  end 

  def create
  	@photo = current_user.photos.build(photo_params)
  	if @photo.save
  		redirect_to photos_path
  	end
  end
  
  def show
  end

  def edit
  end 
  
  def update
  end

  def destroy
  end 

private
  
  def photo_params
  	params.require(:photo).permit(:user_id, :title, :description, :image)
  end  
  
end
