class BrokersController < ApplicationController
  def new
    @broker = Broker.new
  end

  def create
    @broker = Broker.new(broker_params) # use strong params to filter the form fields being saved
    if params[:file].present?
      response = Cloudinary::Uploader.upload(params[:file])
      @broker.image = response['public_id']
      @broker.save
    end
    redirect_to brokers_path
  end

  def index
    @brokers = Broker.all
  end

  def show
    @broker = Broker.find params[:id]
  end

  def edit
     @broker = Broker.find params[:id]
  end

  def update
    broker = Broker.find params[:id]
    if params[:file].present?
      response = Cloudinary::Uploader.upload(params[:file])
      broker.image = response['public_id']
      broker.save
    end
    # Use the same strong params method we used in the create action, for this update:
    broker.update broker_params

    # No template for updates; redirect to the show page (using the path helper)
    redirect_to brokers_path
  end

  def destroy
    Broker.destroy params[:id]
    redirect_to brokers_path
  end

  private
  # ^ private means the following methods (until the end of the class)
  #   are NOT actions, i.e. they do not correspond to routes

  # Strong params! Acts like a doorman with a door list, only letting through
  # the specified form param fields, so we can add them to our table
  def broker_params
    params.require(:broker).permit(:name, :agency, :phno, :mailid, :image)
  end
end
