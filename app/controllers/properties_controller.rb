class PropertiesController < ApplicationController
  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params) # use strong params to filter the form fields being saved
    if params[:file].present?
      response = Cloudinary::Uploader.upload(params[:file])
      @property.image = response['public_id']
      @property.save
    end
    redirect_to properties_path
  end

  def index
    @properties = Property.all
  end

  def show
    @brokers = Broker.all
    @property = Property.find params[:id]
  end

  def edit
     @property = Property.find params[:id]
  end

  def update
    property = Property.find params[:id]
    if params[:file].present?
      response = Cloudinary::Uploader.upload(params[:file])
      property.image = response['public_id']
      property.save
    end
    property.update property_params
    redirect_to properties_path
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
    params.require(:property).permit(:name, :address, :price, :rooms, :bathrooms, :image, :broker_id)
  end
end
