$(document).ready(function(){
  $(document).on("change","#category-select",function(){
  var product_id = $(this).val();
  console.log(product_id);
  $.ajax({
    url: "/admin_sizes",
    method: "GET",
    dataType: "json",
    data: {product_id: product_id},
    error: function (xhr, status, error) {
      console.error('AJAX Error: ' + status + error);
    },
    success: function (response) {
      console.log(response);
      var sizes = response["sizes"];

      $("#size-select").empty();
      for(var i=0; i< sizes.length; i++){
        $("#size-select").append('<option value="' + sizes[i] + '">' + sizes[i] + '</option>');
      }
      $("#quantity-field").empty();
      $("#price-field").empty();
      $("#brand-field").empty();
    }
  });
})});
