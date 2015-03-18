class PulsesController < ApplicationController
  before_action :set_pulse, only: [:show, :edit, :update, :destroy]

  # GET /pulses
  # GET /pulses.json
  def index
    @pulses = Pulse.all.order('updated_at DESC')
     respond_to do |format|
       format.html {  }
       @pulses = @pulses.limit(10)  
       items = @pulses.each_with_index.collect do |date, index|
        {
        id: date.id,
        index: index+1,
        pulse_rate: date.pulse_rate,
        pulse_time: date.created_at.strftime("%b %e, %l:%M %p")    
        }     
      end        
        format.json { render json: items} 
     end

  end

  # GET /pulses/1
  # GET /pulses/1.json
  def show
  end

  # GET /pulses/new
  def new
    @pulse = Pulse.new
  end

  # GET /pulses/1/edit
  def edit
  end

  # POST /pulses
  # POST /pulses.json
  def create

    unless params[:pulse]
      params[:pulse] = params
    end
    @pulse = Pulse.new(pulse_params)

    respond_to do |format|
      if @pulse.save
        format.html { redirect_to @pulse, notice: 'Pulse was successfully created.' }
        format.json { render :show, status: :created, location: @pulse }
      else
        format.html { render :new }
        format.json { render json: @pulse.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_pulse
    Pulse.create(pulse_rate: params[:B])
    render json:{message: "Created Successfully"}, status: :created
  end

  # PATCH/PUT /pulses/1
  # PATCH/PUT /pulses/1.json
  def update
    respond_to do |format|
      if @pulse.update(pulse_params)
        format.html { redirect_to @pulse, notice: 'Pulse was successfully updated.' }
        format.json { render :show, status: :ok, location: @pulse }
      else
        format.html { render :edit }
        format.json { render json: @pulse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pulses/1
  # DELETE /pulses/1.json
  def destroy
    @pulse.destroy
    respond_to do |format|
      format.html { redirect_to pulses_url, notice: 'Pulse was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pulse
      @pulse = Pulse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pulse_params
      params.require(:pulse).permit(:pulse_rate, :pulse_time)
    end
end
