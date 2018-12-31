// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require serviceworker-companion
//= require materialize-sprockets
//= require materialize-form
//= require_tree .


$(document).on("turbolinks:load", function() {
  // cocoon gem, open new input after existent
  ////$("#weighings a.add_fields").data("association-insertion-method", 'before').data("association-insertion-node", 'this');

  //$('.date').pickadate(); 
  //$('select').material_select();
  //$(".button-collapse").sideNav();
  $('.sidenav').sidenav();
  //Materialize.updateTextFields();  
  Waves.displayEffect(); 
  $('.dropdown-button').dropdown(); 
  $('input#input_text, textarea#textarea2').characterCounter();
  $('.dropdown-trigger').dropdown();
   window.materializeForm.init();
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