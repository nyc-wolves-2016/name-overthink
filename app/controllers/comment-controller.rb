post '/questions/:question_id/comments/new' do
  @question = Question.find(params[:question_id])
  @question_comment = @question.comments.new(content: params[:content], user_id: current_user.id)

  if @question_comment.save

    redirect "/questions/#{@question.id}"
  else
    @question_errors = @question_comment.errors.full_messages
    @question.comments.delete(@question_comment)
    erb :'questions/show'
  end

end


post '/questions/:question_id/answer/:answer_id/new' do
  @question = Question.find(params[:question_id])
  answer = Answer.find(params[:answer_id])
  @answer_comment = answer.comments.new(content: params[:content], user_id: current_user.id)

  if @answer_comment.save

    redirect "/questions/#{params[:question_id]}"
  else
    @answer_errors = @answer_comment.errors.full_messages
    answer.comments.delete(@answer_comment)
    erb :'questions/show'
  end

end

