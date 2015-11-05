$(function() {
  $("#new_comment").on('submit', function(e) {
    e.preventDefault();

    var comment = $('#comment_comment').val();
    var item_id = $('#comment_item').val().to_i;
    var user_id = $('#comment_user_id').val();
    var data = { comment: { comment: comment, user_id: user_id } };

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
        $('#comments').prepend('<div>'+res.comment+'</div>');
        $('#comment_comment').val("");
      }
    });
  });
});