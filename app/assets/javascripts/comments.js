$(function() {
  $("#new_comment").on('submit', function(e) {
    e.preventDefault();

    var content = $('#comment_content').val();
    var item_id = $('#comment_item').val();
    var data = { comment: { content: content } };

    $.ajax({
      type: 'post',
      url: '/items/'+item_id,
      dataType: 'json',
      data: data}
    ).done(function(res) {
      if (res.errors) {
        res.errors.forEach(function(err){
          $('#errors').append('<div>'+err+'</div>');
        });
      } else {
        $('#comments').prepend('<div>'+res.content+'</div>');
      }

    });
  });
});