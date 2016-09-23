$(document).ready(function() {
  $('.questionsList').on('submit', '.thumbs_button', function(e) {
    e.preventDefault();
    var data = {question_id: $(this).children('input').attr('value'), value: $(this).children('button').attr('value')};
    
    $.ajax({
      url: "/votes/new",
      method: "POST",
      data: data
    }).done(function(response) {
        $("input[value='" + response.question_id + "']").closest('li').children('span').text(response.total_votes);
    })
  });

  $('#question-comments').on('submit', '.thumbs_button', function(e) {
    e.preventDefault();
    var data = {comment_id: $(this).children('input').attr('value'), value: $(this).children('button').attr('value')};
    
    $.ajax({
      url: "/votes/new",
      method: "POST",
      data: data
    }).done(function(response) {
        // debugger;
        if (response.error) {
            $("input[value='" + response.comment_id + "']").closest('li').append('<p>You already voted on that comment silly-pie</p>')
        } else {
        $("input[value='" + response.comment_id + "']").closest('li').children('span').text(response.total_votes);
        }
    })
  });
});
