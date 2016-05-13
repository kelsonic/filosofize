get '/ponderings/new' do
  redirect '/' unless current_user
  erb :'ponderings/new'
end

post '/ponderings' do
  @pondering = current_user.ponderings.new(params[:pondering])

  if @pondering.save
    redirect "/ponderings/#{@pondering.id}"
  else
    @errors = @pondering.errors.full_messages
    erb :'ponderings/new'
  end
end

get '/ponderings/:id' do
  @pondering = Pondering.find(params[:id])
  erb :'ponderings/show'
end

get '/ponderings' do
  @ponderings = Pondering.all
  erb :'ponderings/index'
end
