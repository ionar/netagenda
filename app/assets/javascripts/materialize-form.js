window.materializeForm = {
  init: function() {
    this.initSelect()
    this.initCheckbox()
    this.initDate()
  },
  initSelect: function() {
    $('select[multiple="multiple"] option[value=""]').attr('disabled', true)
    if (typeof $('select').material_select === "function") {
      $('select').material_select()
    } else {
      $('select').formSelect()
    }

  },
  initCheckbox: function() {
    $('input[type=checkbox]').addClass('filled-in')
  },
  initDate: function() {
    if (typeof $('input.date').pickadate === "function") {
      $('input.date').pickadate({
        selectMonths: true,
        selectYears: 100
      });
    } else {
      $('input.date').datepicker({
        selectMonths: true,
        selectYears: 100
      });
    }
  }
}
/*
$(document).ready(function() {
  window.materializeForm.init()
});

$(document).ajaxSuccess(function() {
  window.materializeForm.init()
});
*/