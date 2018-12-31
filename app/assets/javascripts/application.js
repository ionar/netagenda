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
  M.updateTextFields();
  $('select').formSelect();
  $('.dropdown-button').dropdown(); 
  $('input#input_text, textarea#textarea2').characterCounter();
  $('.dropdown-trigger').dropdown();
   Waves.displayEffect(); 
   window.materializeForm.init();
   $('.sidenav').sidenav();

  //$('.date').pickadate(); 
});

/*
// Brazilian Portuguese
	jQuery.extend( jQuery.fn.pickadate.defaults, {
	    monthsFull: [ 'janeiro', 'fevereiro', 'março', 'abril', 'maio', 'junho', 'julho', 'agosto', 'setembro', 'outubro', 'novembro', 'dezembro' ],
	    monthsShort: [ 'jan', 'fev', 'mar', 'abr', 'mai', 'jun', 'jul', 'ago', 'set', 'out', 'nov', 'dez' ],
	    weekdaysFull: [ 'domingo', 'segunda-feira', 'terça-feira', 'quarta-feira', 'quinta-feira', 'sexta-feira', 'sábado' ],
	    weekdaysShort: [ 'dom', 'seg', 'ter', 'qua', 'qui', 'sex', 'sab' ],
	    today: 'hoje',
	    clear: 'limpar',
	    close: 'fechar',
	    //format: 'dddd, d !de mmmm !de yyyy',
	    format: 'yyyy/mm/dd',
	    formatSubmit: 'yyyy/mm/dd'
	});

	jQuery.extend( jQuery.fn.pickatime.defaults, {
	    clear: 'limpar'
	});
*/

// Fix bug with turbolinks and sidenav
document.addEventListener('turbolinks:before-render', () => {
  const elem = document.querySelector('.sidenav');
  const instance = M.Sidenav.getInstance(elem);
  if (instance) {
    instance.destroy();
  }
});