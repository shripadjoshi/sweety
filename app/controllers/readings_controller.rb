class ReadingsController < ApplicationController

  before_action :username, except: [:create]
  
  def index
    @readings = current_user.readings
    #@username = username
  end

  def new
    @reading = Reading.new
    #@username = username
  end

  def create
    @reading = Reading.new(reading_params)
    @reading.user = current_user

    if @reading.save
      redirect_to @reading
    else
      render 'new'
    end
  end

  def show
    @reading = Reading.find(params[:id])
    #@username = username
  end

  private
  
  def reading_params
    params.require(:reading).permit(:glucose_level, :current_user)
  end

  def username
    @username = current_user.username.capitalize
  end

end
