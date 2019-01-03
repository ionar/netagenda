//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require serviceworker-companion
//= require materialize
//= require_tree .

$(document).on('nested:fieldAdded', function(event){
  window.materializeForm.init()
});

$(document).on("turbolinks:load", function() {
  console.log("LOAD rodou");
  // cocoon gem, open new input after existent
  ////$("#weighings a.add_fields").data("association-insertion-method", 'before').data("association-insertion-node", 'this');

  M.textareaAutoResize($('.materialize-textarea'));
  M.updateTextFields();
  $('select').formSelect();
  $('.dropdown-button').dropdown(); 
  $('input#input_text, textarea#textarea2').characterCounter();
  $('.dropdown-trigger').dropdown();
   Waves.displayEffect(); 
   window.materializeForm.init();
  $('.sidenav').sidenav();

  $('.abre-calendario').datepicker({
  	selectMonths: true,
  	showDaysInNextAndPreviousMonths: true,
  	showMonthAfterYear: true,
    yearRange: 100,
    autoClose: false,
    container: 'body',
    setDefaultDate: true,
    showClearBtn: true,
    // Formato da data que aparece no input
    format: 'dd/mm/yyyy',
    allowInputToggle: true,
    //formatSubmit: 'yyyy/mm/dd', configurado em initilizers/time_formats.rb
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