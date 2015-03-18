class TemperaturesController < ApplicationController
  before_action :set_temperature, only: [:show, :edit, :update, :destroy]

  # GET /temperatures
  # GET /temperatures.json
  def index
    @temperatures = Temperature.all.order('updated_at DESC')
     respond_to do |format|
       format.html {  }
       @temperatures = @temperatures.limit(10)  
       items = @temperatures.each_with_index.collect do |date, index|
        {
        id: date.id,
        index: index+1,
        temp_time: date.created_at.strftime("%b %e, %l:%M %p"),
        celcius: date.celcius,
        farenhiet: date.farenhiet
        }     
      end        
        format.json { render json: items} 
     end
  end

  # GET /temperatures/1
  # GET /temperatures/1.json
  def show
  end

  # GET /temperatures/new
  def new
    @temperature = Temperature.new
  end

  # GET /temperatures/1/edit
  def edit
  end

  # POST /temperatures
  # POST /temperatures.json
  def create
  
    unless params[:temperature]
      params[:temperature] = params
    end
    @temperature = Temperature.new(temperature_params)

    respond_to do |format|
      if @temperature.save
        format.html { redirect_to @temperature, notice: 'Temperature was successfully created.' }
        format.json { render json:{message: "Created Successfully"}, status: :created}
      else
        format.html { render :new }
        format.json { render json: @temperature.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def create_temp
    p "_____________________________"
    Temperature.create(celcius: params[:Te], farenhiet: params[:Fa])
    render json:{message: "Created Successfully"}, status: :created
  end

  # PATCH/PUT /temperatures/1
  # PATCH/PUT /temperatures/1.json
  def update
    respond_to do |format|
      if @temperature.update(temperature_params)
        format.html { redirect_to @temperature, notice: 'Temperature was successfully updated.' }
        format.json { render :show, status: :ok, location: @temperature }
      else
        format.html { render :edit }
        format.json { render json: @temperature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /temperatures/1
  # DELETE /temperatures/1.json
  def destroy
    @temperature.destroy
    respond_to do |format|
      format.html { redirect_to temperatures_url, notice: 'Temperature was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_temperature
      @temperature = Temperature.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def temperature_params
      params.require(:temperature).permit(:temp_time, :celcius, :farenhiet)
    end
end
