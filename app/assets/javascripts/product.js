$(function(){
    $("#addProduct").on("click", function() {
      $("#trForm").clone(true).appendTo("table");
    });
  });
