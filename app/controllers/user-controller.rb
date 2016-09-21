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

get '/users/:id' do

end

post '/users/logout' do

end


