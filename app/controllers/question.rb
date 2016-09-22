get '/questions' do 
	@questions = Question.all 
	erb :'shared/_questions_list'
end

get '/questions/:id' do
	@question= Question.find(params[:id])
	erb :'questions/show'
end