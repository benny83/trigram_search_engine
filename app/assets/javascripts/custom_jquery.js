$(document).ready(function(){
  $('#trigram_search').on('keyup', function(e) {
    var chars = $(this).val()
    // alert(chars);
    $.ajax({
      url: '/',
      method: 'GET',
      data: { chars : chars }
    });
  });
});
