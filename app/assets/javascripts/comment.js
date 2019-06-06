$(function(){
  function buildHTML(comment){
    var html = `<div class=comment-list__row >
                  <a href=/users/${comment.user_id}>${comment.user_name}</a>
                  ":  ${comment.comment}"
                </div>`
  }
  $('.comment-form').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.comment-list').append(data);
      $('.comment-form').val('')
    })
    .fail(function(){
      alert('error');
    })
  })
});