function remove_fields (link) {
	$(link).previous("input[type=hidden]").value ="1";
	$(link).up(".fields").hide();
}

function add_fields(link, association, text) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).up().insert({
    before: text.replace(regexp, new_id)
  });
}



