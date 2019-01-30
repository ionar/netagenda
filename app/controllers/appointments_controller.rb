class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :dia_selected

  def diasel
    @appointments = Appointment.where(nil)
    @appointments = @appointments.para_o_calendar(current_user.calendar_id).para_o_dia(dia_selected)

    respond_to do |format|
      format.js
    end
  end

  # GET /appointments
  # GET /appointments.json

##  def calendar
##    @appointments = Appointment.all
##  end

  def index
    ##@appointments = Appointment.all
    @appointments = Appointment.where(nil)
    @appointments = @appointments.para_o_calendar(current_user.calendar_id).para_o_dia(dia_selected)

    if params[:start_date].present?
      mes_para_consulta = params[:start_date].to_date
    else
      mes_para_consulta = Date.current
    end

    beginning_of_month = mes_para_consulta.beginning_of_month
    end_of_month = beginning_of_month.end_of_month

    @appointments_todos = Appointment.where(schedule_on: beginning_of_month..end_of_month)
    @appointments_todos = @appointments_todos.para_o_calendar(current_user.calendar_id)

  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
    @appointment.appointment_time = @appointment.appointment_time_only
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:finalized, :name, :schedule_on, :calendar_id, :client_id, :appointment_time, :service_ids => [])
    end

    def dia_selected
      if params[:dia].present?
        return Date.parse(params[:dia])
      else
        return Date.current
      end
    end
end
