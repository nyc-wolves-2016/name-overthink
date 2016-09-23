$(document).ready(function() {
  $('.questionsList').on('submit', '.thumbs_button', function(e) {
    e.preventDefault();
    $(".questionsList").find('p').remove();
    var data = {question_id: $(this).children('input').attr('value'), value: $(this).children('button').attr('value')};

    $.ajax({
      url: "/votes/new",
      method: "POST",
      data: data
    }).done(function(response) {
        if (response.error) {
            $("input[value='" + response.question_id + "']").closest('li').append('<p>You already voted on that question silly-pie</p>');
            $('.questionsList').find('p').css({ color : 'red'})
        } else {
        $("input[value='" + response.question_id + "']").closest('li').children('span').text(response.total_votes);
        }
    })
  });

  $('#question-comments').on('submit', '.thumbs_button', function(e) {
    e.preventDefault();
    var data = {comment_id: $(this).children('input').attr('value'), value: $(this).children('button').attr('value')};
    $("#question-comments").find('p').remove();

    $.ajax({
      url: "/votes/new",
      method: "POST",
      data: data
    }).done(function(response) {
        if (response.error) {
            // debugger;
            $("input[value='" + response.comment_id + "']").closest('li').append('<p>You already voted on that comment silly-pie</p>');
            $('#question-comments').find('p').css({ color : 'red'})
        } else {
        $("input[value='" + response.comment_id + "']").closest('li').children('span').text(response.total_votes);
        }
    })
  });

  $('.answers').on('submit', '.thumbs_button', function(e) {
    e.preventDefault();
    var data = {answer_id: $(this).children('input').attr('value'), value: $(this).children('button').attr('value')};
    $(".answers").find('p').remove();
    console.log(data);
    $.ajax({
      url: "/votes/new",
      method: "POST",
      data: data
    }).done(function(response) {
        if (response.error) {
            $("input[value='" + response.answer_id + "']").closest('li').append('<p>You already voted on that answer silly-pie</p>');
            $('.answers').find('p').css({ color : 'red'})
        } else {
        $("input[value='" + response.answer_id + "']").closest('li').children('span').text(response.total_votes);
        }
    })
  });

































  $('#question-comment-form').on('submit', function(event) {
    event.preventDefault();
    var data = $(this).serialize();
    var url = $(this).attr('action');

    $.ajax({
      url: url,
      method: 'POST',
      data: data
    }).done(function(response) {
    // debugger;
      $('#question-comments').find("li").last().after(response);
    });
  });

  $('.answer-comment-form').on('submit', function(event) {
    event.preventDefault();
    var data = $(this).serialize();
    var url = $(this).attr('action');
    // debugger;
    $.ajax({
      url: url,
      method: 'POST',
      data: data
    }).done(function(response) {
      $(event.target).siblings('.answer-comments').find("li").last().after(response);
    });
  });

});















