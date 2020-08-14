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
    broker.update broker_params
    redirect_to brokers_path
  end

  def destroy
    Broker.destroy params[:id]
    redirect_to brokers_path
  end

  private
  def broker_params
    params.require(:broker).permit(:name, :agency, :phno, :mailid, :image)
  end
end
