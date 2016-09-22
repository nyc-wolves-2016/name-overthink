def current_user
  User.find_by(id: session[:user_id])
end

def logged_in?
  !!current_user
end


def require_user
  redirect '/' unless logged_in?
end

def find_question(comment)
  if comment.commentable_type == "Question"
    Question.find_by(id: comment.commentable_id).id
  else
    Answer.find_by(id: comment.commentable_id).question_id
  end
end

