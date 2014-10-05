//= require jquery.maskMoney

// function initMasks () {

// }

// $(function() {
//   initMasks();
// });

$(document).on('rails_admin.dom_ready', function(){
  var $currencyInputs = $('.currency');
  $currencyInputs.maskMoney({ allowZero: true, thousands: '.', decimal: ',' });
  $currencyInputs.maskMoney('mask'); // apply the mask for already filled inputs
});