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
});
