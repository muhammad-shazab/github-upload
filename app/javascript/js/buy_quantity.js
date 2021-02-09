
$(document).ready(function(){
$(document).on('click', '#plus-button', function() {
		var max=document.getElementById('counter-field').getAttribute('max');
		var current_value=parseInt(document.getElementById("counter-field").value,10);
		if (current_value<max) {
		document.getElementById("counter-field").value = current_value+1;
		}
});
$(document).on('click', '#minus-button', function() {
		var current_value=parseInt(document.getElementById("counter-field").value,10);
		if (current_value>1) {
		document.getElementById("counter-field").value = current_value-1;
		}
});
});
