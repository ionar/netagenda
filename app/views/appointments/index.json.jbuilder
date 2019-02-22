#json.array! @appointments, partial: 'appointments/appointment', as: :appointment
json.array!(@appointments_all) do |event|

  inicio_formatado = event.schedule_on.strftime("%Y%m%d") + "T" + event.appointment_time.strftime("%H%M%S") + "Z"
  final_formatado = event.schedule_on.strftime("%Y%m%d") + "T" + hora_termino_helper(event) + "Z"
  json.extract! event, :id, :name
  json.day event.schedule_on  
  json.start inicio_formatado 
  #json.end event.end_date   
  json.end final_formatado
  if event.services.present?
  	json.title event.name.upcase + " (" + event.services.map(&:name).join(" - ") + ")"
  else
  	json.title event.name.upcase
  end
  json.url appointment_url(event, format: :html) 
  json.color Settings.tema.cor.primaria_hexa if event.finalized?
end

#20190218T141053Z