get "/" do
  erb :index
end

get "/login" do
  erb :"logins/login"
end


post "/login" do
  @filosofer = Filosofer.find_by(username: params[:username])
  if @filosofer && @filosofer.authenticate(params[:password])
    session[:id] = @filosofer.id
    redirect "/filosofers/#{@filosofer.id}"
  else
    erb :"logins/login"
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
