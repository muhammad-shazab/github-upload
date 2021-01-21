

$(document).on('click', '#plus-button', function() {
		var max=$(document).getElementById('mycontainer').data('source');
		var current_value=parseInt(document.getElementById("counter-field").value,10);
		if (current_value<max) {
		document.getElementById("counter-field").value = current_value+1;
		}
});


$(document).on('click', '#minus-button', function() {
  var myField=$(document).getElementbyId("value-field").val();
  var currentVal=parseInt(myField,10);
  $(document).getElementbyId("value-field").value=currentVal-1;
});

function increment(){
		var max=<%= @current_var.quantity%>;
		var current_value=parseInt(document.getElementById("counter-field").value,10);
		if (current_value<max) {
		document.getElementById("counter-field").value = current_value+1;
		}
	}
	function decrement(){
		var current_value=parseInt(document.getElementById("counter-field").value,10);
		if (current_value>1) {
		document.getElementById("counter-field").value = current_value-1;
		}
	}
