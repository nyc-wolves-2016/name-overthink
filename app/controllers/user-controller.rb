post '/users/new' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = user.errors.full_messages
    erb :'/users/_new', locals: {errors: @errors}
  end
end

get '/users/new' do
  erb :'/users/_new'
end



post '/users/login' do
  user = User.find_by(email: params[:email])

  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    @error = "Invalid email or password"
    @questions = Question.all
    erb :index
  end
end

get '/users/logout' do
  require_user
  session.clear
  redirect '/'
end

get '/users/:id' do
  require_user
  @user = User.find_by(id: params[:id])
  erb :'/users/show'
end
