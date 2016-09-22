post '/questions/:question_id/comments/new' do
  @question = Question.find(params[:question_id])
  @question_comment = @question.comments.new(content: params[:content], user_id: current_user.id)

  if @question_comment.save

    redirect "/questions/#{@question.id}"
  else
    @errors = @question_comment.errors.full_messages
    @question.comments.delete(@question_comment)
    erb :'questions/show'
  end

end

