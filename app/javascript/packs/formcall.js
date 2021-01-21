$(document).on("change","#category-select", function(){
  var category = $(this).val();
  $.ajax({
    url: "/products",
    method: "GET",
    dataType: "json",
    data: {category: category},
    error: function (xhr, status, error) {
      console.error('AJAX Error: ' + status + error);
    },
    success: function (response) {
      console.log(response);
      var sizes = response["sizes"];

      $("#size-select").empty();
      
      $("#size-select").append('<option>Select Size</option>');
      for(var i=0; i< sizes.length; i++){
        $("#size-select").append('<option value="' + sizes[i] + '">' + sizes[i] + '</option>');
      }
      $("#quantity-field").empty();
      $("#price-field").empty();
      $("#brand-field").empty();
    }
  });
});
