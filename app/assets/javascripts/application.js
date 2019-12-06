//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require serviceworker-companion
//= require materialize
//= require moment
//= require fullcalendar
//= require fullcalendar/locale-all
//= require_tree .


  function eventCalendar() {
    return $('#calendar').fullCalendar({
      dayClick: function(date, allDay, jsEvent, view) {
      dia = moment.utc(date).format('DD-MM-YYYY');

      hora = moment.utc(date).format('HH:mm');
      if (allDay) {
        // Clicked on the entire day
        //alert(date.toDate());
        //alert(hora);
        url = "/appointments/new?dia="+dia+"&hora="+hora;
        location.href = url;
      }
    },
    header: {
    left: 'prev,next today',
    center: 'title',
    right: 'month,agendaWeek,agendaDay'
    },
    locale: 'pt-br',
    allDaySlot: false,
    events: '/appointments.json',
    defaultView: 'agenda',
    minTime: '07:00:00',
    maxTime: '20:30:00',
    height: 800,
    selectable: true,
    selectHelper: true,
    editable: false,
    eventLimit: true,
    navLinks: true,
    unselectAuto: true,
    themeSystem: "standard",
    handleWindowResize: true,
    weekends: true, // Show weekends
    displayEventTime: true, // Display event time
    });
  };

  function clearCalendar() {
    $('#calendar').fullCalendar('delete');
    $('#calendar').html('');
  };


$(document).on('nested:fieldAdded', function(event){
  window.materializeForm.init()
});

$(document).on('turbolinks:before-cache', clearCalendar);

$(document).on("turbolinks:load", function() {
  

  eventCalendar(); //fullcalendar
  // cocoon gem, open new input after existent
  ////$("#weighings a.add_fields").data("association-insertion-method", 'before').data("association-insertion-node", 'this');

  //Tentando customizar o fullcalendar
  //$('.fc-center h2').addClass("flow-text");

  M.Modal._count = 0;
  $('.modal').modal();
  //M.textareaAutoResize($('.materialize-textarea')); //colocar em cada form
  M.updateTextFields();
  $('select').formSelect();
  $('.dropdown-button').dropdown();
  $('input#input_text, textarea#textarea2').characterCounter();
  $('.dropdown-trigger').dropdown();
   Waves.displayEffect();
   window.materializeForm.init();
  $('.sidenav').sidenav();

  $('.abre-calendario-hora').timepicker({
    twelveHour: false,
  });


  $('.abre-calendario').datepicker({
  	selectMonths: true,
  	showDaysInNextAndPreviousMonths: true,
  	showMonthAfterYear: true,
    yearRange: 100,
    autoClose: false,
    container: 'body',
    setDefaultDate: false,
    showClearBtn: true,
    // Formato da data que aparece no input
    ////format: 'yyyy-mm-dd',
    format: 'dd-mm-yyyy',
    allowInputToggle: true,
    formatSubmit: 'dd-mm-yyyy', //configurado ou nao em initilizers/time_formats.rb
    onClose: function() {
      $(document.activeElement).blur()
    },

  	i18n: {
	    today: 'Hoje',
	    clear: 'Limpar',
	    done: 'Ok',
	    nextMonth: 'Próximo mês',
	    previousMonth: 'Mês anterior',
	    weekdaysAbbrev: ['D', 'S', 'T', 'Q', 'Q', 'S', 'S'],
	    weekdaysShort: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb'],
	    weekdays: ['Domingo', 'Segunda-Feira', 'Terça-Feira', 'Quarta-Feira', 'Quinta-Feira', 'Sexta-Feira', 'Sábado'],
	    monthsShort: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'],
	    months: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro']
	}
  });

});

// Fix bug with turbolinks and sidenav
document.addEventListener('turbolinks:before-render', () => {
  const elem = document.querySelector('.sidenav');
  const instance = M.Sidenav.getInstance(elem);
  if (instance) {
    instance.destroy();
  }
});

$(document).on('ready page:load', function() {
  var REFRESH_INTERVAL_IN_MILLIS = 5000;
   if ($('.f-pending-message').length > 0) {
     setTimeout(function(){
      #disable page scrolling to top after loading page content
      Turbolinks.enableTransitionCache(true);

      # pass current page url to visit method
      Turbolinks.visit(location.toString());

      #enable page scroll reset in case user clicks other link
      Turbolinks.enableTransitionCache(false);
       }, REFRESH_INTERVAL_IN_MILLIS);
  }
});