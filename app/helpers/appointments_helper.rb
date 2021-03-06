module AppointmentsHelper
	def events_ajax_previous_link
    	->(param, date_range) { link_to raw("&laquo;"), {param => date_range.first - 1.day}, remote: :true}
  	end

  	def events_ajax_next_link
    	->(param, date_range) { link_to raw("&raquo;"), {param => date_range.last + 1.day}, remote: :true}
  	end

def apontamento(hora)
    hora = hora

    inicio_periodo = Time.zone.parse(hora)
    #puts inicio_periodo
    fim_do_periodo = inicio_periodo + 29.minutes

    @atendimentos = @appointments.where(appointment_time: inicio_periodo..fim_do_periodo)
    if (@atendimentos.length != 0)
      concatenada = ""
      ##Mostrar botao para adicionar mais um agendamento para o mesmo horario
      concatenada << link_to("<i class='material-icons'>add</i>".html_safe, new_appointment_path(:dia => dia_selected_helper, :hora => hora), class: "waves-effect waves-light btn-small #{Settings.tema.cor.primaria}")      
      
      @atendimentos.each do |consulta|
        concatenada << " "
        if consulta.finalized == true
          concatenada << link_to("<i class='material-icons left'>check_box</i> #{consulta.name}".html_safe, consulta, class: "waves-effect waves-light btn-small blue")
        else
          concatenada << link_to("<i class='material-icons left'>access_time</i> #{consulta.name}".html_safe, consulta, class: "waves-effect waves-light btn-small orange")
        end   
      end
            
      return  "<span class='badge'>#{hora}</span> #{concatenada}".html_safe

      ##return "aqui tem #{@atendimentos.length} - #{concatenada}".html_safe + " <span class='badge'>#{hora}</span>".html_safe
    else
      return link_to("<i class='material-icons'>add</i>".html_safe, new_appointment_path(:dia => dia_selected_helper, :hora => hora), class: "waves-effect waves-light btn-small #{Settings.tema.cor.primaria}") + " <span class='badge'>#{hora}</span>".html_safe
    end
end

  def total_apontamentos_dia_para_o_calendar
  	##calendar = current_user.calendar_id
  	##@agendamentos = @appointments.where(start_time: dia.beginning_of_day).where(calendar: calendar)
  	##@agendamentos = @appointments.where('appointment_time BETWEEN ? AND ?', dia_selected.beginning_of_day, dia_selected.end_of_day).where(calendar: calendar)
  	##@agendamentos = @appointments.where('appointment_time BETWEEN ? AND ?', dia_selected.beginning_of_day, dia_selected.end_of_day)
  	return @appointments.length
  end

  def vinculo_msg(agendamento)
    agendamento = agendamento
    if agendamento.client.present?
      return '<div><span class="flow-text white-text">Vinculado ao cadastro</span><span class="secondary-content"><i class="material-icons flow-text white-text">check</i></span></div>'.html_safe
    else
      return '<div><span class="flow-text white-text">Não vinculado ao cadastro</span><span class="secondary-content"><i class="material-icons flow-text white-text">announcement</i></span></div>'.html_safe
    end
  end

  def pulse_btn(agendamento)
    agendamento = agendamento
    if agendamento.client.present?
      return ''.to_s
    else
      return 'pulse'.to_s
    end
  end

  def hora_termino_helper(agendamento)
    agendamento = agendamento
    if agendamento.duration.present?
      inicio = agendamento.appointment_time
      duration = agendamento.duration
      termino = inicio + duration.minutes
      return termino.strftime("%H%M%S")
    else
      return "001500"
    end
  end

  def hora_termino_helper_show(agendamento)
    agendamento = agendamento
    if agendamento.duration.present?
      inicio = agendamento.appointment_time
      duration = agendamento.duration
      termino = inicio + duration.minutes
      return termino.strftime("%H:%M")
    else
      return "Não informado"
    end
  end  
end
