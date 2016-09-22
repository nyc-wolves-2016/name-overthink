
# - have post votes/new route 

# - have delete votes/:id route 

# -have post comments/new route 

post '/votes/new' do
  if params[:value] == "up_vote"
    value = 1
  else 
    value = -1
  end    
  puts "Yoooooooooooo"
  puts value
  vote = Question.find(params[:question_id]).votes.new(value: value, user_id: current_user.id)
  if vote.save
    redirect '/questions'
  else
    @questions = Question.all
    @errors = vote.errors.full_messages
    erb :'/shared/_questions_list', locals: {questions: @questions}
  end
end
