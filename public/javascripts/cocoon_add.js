$(document).ready(function() {

  $('.add_fields_on_data').live('keypress', function() {
    if ($(this).value.length == 0) {
      $(this).removeClass('added_on_data');
      return; 
    } // TODO: remove and reset added_on_data class
    if ($(this).hasClass('added_on_data')) return;
    $(this).addClass('added_on_data');
    var assoc   = $(this).attr('data-association');
    var content = $(this).attr('data-template');
    var insertionPosition = $(this).attr('data-association-insertion-position');
    var insertionNode = $(this).attr('data-association-insertion-node');
    var regexp_braced = new RegExp('\\[new_' + assoc + '\\]', 'g');
    var new_id  = new Date().getTime();
    var new_content = content.replace(regexp_braced, '[' + new_id + ']');
    if (new_content == content) {
        regexp_braced = new RegExp('\\[new_' + assoc + 's\\]', 'g');
        new_content = content.replace(regexp_braced, '[' + new_id + ']');
    }
    if (insertionNode) {
      insertionNode = $(insertionNode);
    }
    else {
      insertionNode = $(this).parent();
    }
    
    if (insertionPosition == 'after'){
      insertionNode.after(new_content);
    } else {
      insertionNode.before(new_content); 
    }
    
    return false;
  });

  $('.remove_fields.dynamic').live('click', function() {
    $(this).closest(".nested-fields").remove();
    return false;
  });

  $('.remove_fields.existing').live('click', function() {
    $(this).prev("input[type=hidden]").val("1");
    $(this).closest(".nested-fields").hide();
    return false;
  });

});

