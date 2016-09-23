
# - have post votes/new route 

# - have delete votes/:id route 

# -have post comments/new route 

post '/votes/new' do
  if params[:value] == "up_vote"
    value = 1
  else 
    value = -1
  end   


  if params[:question_id]
    vote = Question.find_by(id: params[:question_id]).votes.new(value: value, user_id: current_user.id)

    if vote.save
      if request.xhr?
        content_type :json
        {question_id: params[:question_id], total_votes: Vote.vote_count(Question.find_by(id: params[:question_id]).votes)}.to_json
      else
      redirect '/questions'
      end
    else
  #ajaxify?
      @questions = Question.all
      @errors = vote.errors.full_messages
      erb :'/shared/_questions_list', locals: {questions: @questions}
    end
  else
    if params[:answer_id]
      vote = Answer.find(params[:answer_id]).votes.new(value: value, user_id: current_user.id)
      question_id = Answer.find(params[:answer_id]).question_id
    else
      vote = Comment.find(params[:comment_id]).votes.new(value: value, user_id: current_user.id)
      question_id = find_question(Comment.find(params[:comment_id]))
    end  
    if vote.save
      if request.xhr?
        if vote.voteable_type == "Answer"
          content_type :json
          {answer_id: params[:answer_id], total_votes: Vote.vote_count(Answer.find_by(id: params[:answer_id]).votes)}.to_json
        else 
          content_type :json
          {comment_id: params[:comment_id], total_votes: Vote.vote_count(Comment.find_by(id: params[:comment_id]).votes)}.to_json
        end
      else
        redirect "/questions/#{question_id}"
      end 
    else
      if request.xhr?
        if vote.voteable_type == "Answer"
          content_type :json
          {answer_id: params[:answer_id], total_votes: Vote.vote_count(Answer.find_by(id: params[:answer_id]).votes), error: true}.to_json
        else 
          content_type :json
          {comment_id: params[:comment_id], total_votes: Vote.vote_count(Comment.find_by(id: params[:comment_id]).votes), error: true}.to_json
        end
      else
        @question = Question.find(question_id)
        @errors = vote.errors.full_messages
        puts @errors
        erb :'/questions/show'
      end
    end
  end
end
