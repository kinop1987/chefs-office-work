$(function(){
  $(".quantity").each(function(index, element){
    let val = $(element).val();
    if(val == ""){
      $(element).parent().parent().remove();
    }
  })
});
  