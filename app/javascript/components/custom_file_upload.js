const getFileName = () => {
  if (document.querySelector('#playlist_new')) {
    $('#inputGroupFile02').change(function() {
      var i = $(this).prev('label').clone();
      var file = $('#inputGroupFile02')[0].files[0].name;
      $(this).prev('label').text(file);
    });
  }
}

export { getFileName }
