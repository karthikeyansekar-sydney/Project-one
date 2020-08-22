class PropertiesController < ApplicationController
  def new
    @property = Property.new
  end

  def create
    @property = Property.create(property_params) # use strong params to filter the form fields being saved
    if @property.persisted?
      #property successfully created ..try uploading a photo
      if params[:file].present?
        response = Cloudinary::Uploader.upload(params[:file])
        Photo.create image: response['public_id'], property_id: @property.id
      end
      redirect_to properties_path
    else
      #validation error for property..Redisplay Form
      render :new
    end
  end #create

  def index
    @photos = Photo.all
    @properties = Property.all
  end

  def show
    @property = Property.find params[:id]
  end

  def edit
     @property = Property.find params[:id]
  end

  def update
    @property = Property.find params[:id]
    if @property.update property_params #returns true
      #remove all photo associations so we can add back only the photos that are checked in the edit form
      #we do this before the file upload so we dont lose the association of the uploaded photo
      @property.photos.delete_all

      if params[:file].present?
        response = Cloudinary::Uploader.upload(params[:file])
        Photo.create image: response['public_id'], property_id: @property.id
      end

      #reset photo associations from checked list in form
      @property.photos << Photo.find(params[:photo_id])
      redirect_to properties_path
    else
       render :edit
    end
  end

  def destroy
    Property.destroy params[:id]
    redirect_to properties_path
  end

  def search
    prop = params[:search_name]
    if prop.present?
      @properties = Property.where('address ILIKE ?', "%#{prop}%")
    else
      @properties = Property.all
    end
    if params[:bedrooms].present?
      @properties = @properties.where(rooms: params[:bedrooms])
    end
  end
  private
  def property_params
    params.require(:property).permit(:name, :address, :price, :rooms, :bathrooms, :garage, :broker_id)
  end
end
