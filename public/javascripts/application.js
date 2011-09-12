// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
  $("table#tableSortAccounts").tablesorter();
  $("table#tableSortMovements").tablesorter();
  $("#movement_date").datepicker({ dateFormat: 'dd/mm/yy' });
  $(".currency").maskMoney({thousands:',', decimal:'.', allowZero: true, allowNegative: true});
});
