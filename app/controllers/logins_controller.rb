get "/" do
  erb :index
end

post "/login" do
  @filosofer = Filosofer.find_by(params[:username])
  if @filosofer && @filosofer.authenticate(params[:password])
    session[:id] = @filosofer.id
    redirect "/filosofers/#{@filosofer.id}"
  else
    erb :"login/login"
  end

end
