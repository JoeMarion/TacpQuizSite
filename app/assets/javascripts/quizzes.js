$(document).ready(function() {

  $('#answer').click(function(e) {
    e.preventDefault();
    $.ajax({
      type: "post",
      url: $(this).attr('ajax_path'),
      data: { _method: 'PUT'},
      dataType: 'script'
    });
  });

  $('.correct').click(function(e) {
    e.preventDefault();
    $.ajax({
      type: "post",
      url: $(this).attr('ajax_path'),
      data: { _method: 'PUT',  answer: 'true' },
      dataType: 'script'
    });
  });
});
