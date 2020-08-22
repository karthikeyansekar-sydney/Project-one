class PhotosController < ApplicationController
  def new
  end

  def create
      if params[:file].present?
        response = Cloudinary::Uploader.upload(params[:file])
        Photo.create image: response['public_id'], property_id: params[:property_id]
      end
      redirect_to property_path
  end

  def update
  end

  def destroy
  end
end
