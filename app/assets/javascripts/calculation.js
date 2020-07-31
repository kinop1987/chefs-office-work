$(function() {
  $('#calculation').on('click', function() {
    let income = parseInt($("#income").val());
    let last_invent = parseInt($("#last_invent").val());
    let this_invent = parseInt($("#this_invent").val());
    let cost = parseInt(($("#cost").val()));
    let calculation = cost + last_invent - this_invent;
    let cost_rate = calculation / income * 100;
    let r_calculation = Math.round(cost_rate * 10) / 10;
    $('#cost_rate').val(r_calculation);
  });
});
