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
    @property = Property.find params[:id]
  end

  def edit
     @property = Property.find params[:id]
  end

  def update
    property = Property.find params[:id]

    # Use the same strong params method we used in the create action, for this update:
    property.update property_params

    # No template for updates; redirect to the show page (using the path helper)
    redirect_to properties_path
  end

  def destroy
    Property.destroy params[:id]
    redirect_to properties_path
  end

  private
  # ^ private means the following methods (until the end of the class)
  #   are NOT actions, i.e. they do not correspond to routes

  # Strong params! Acts like a doorman with a door list, only letting through
  # the specified form param fields, so we can add them to our table
  def property_params
    params.require(:property).permit(:name, :address, :price, :rooms, :bathrooms, :image)
  end
end
