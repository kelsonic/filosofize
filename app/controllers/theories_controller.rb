get "/ponderings/:id/theories/new" do
  logged_in?
  @pondering = Pondering.find(params[:id])
  erb :'theories/new'
end

post "/ponderings/:id/theories" do
  @pondering = Pondering.find(params[:id])
  @theory = @pondering.theories.new(body: params[:body],
    filosofer_id: current_user.id,
    pondering_id: @pondering.id)

  if @theory.save
    redirect "/ponderings/#{@pondering.id}"
  else
    @errors = @theory.errors.full_messages
    erb :'theories/new'
  end
end

post '/ponderings/:pondering_id/theories/:id/upvote' do
  @pondering = Pondering.find(params[:pondering_id])
  @theory = Theory.find(params[:id])
  @upvote = @theory.upvotes.new(filosofer_id: current_user.id)

  if @upvote.save
    redirect "/ponderings/#{@pondering.id}"
  else
    @errors = @upvote.errors.full_messages
    redirect "/ponderings/#{@pondering.id}"
  end
end

post '/ponderings/:pondering_id/theories/:id/downvote' do
  @pondering = Pondering.find(params[:pondering_id])
  @theory = Theory.find(params[:id])
  @downvote = @theory.downvotes.new(filosofer_id: current_user.id)

  if @downvote.save
    redirect "/ponderings/#{@pondering.id}"
  else
    @errors = @downvote.errors.full_messages
    redirect "/ponderings/#{@pondering.id}"
  end
end

post '/ponderings/:pondering_id/theories/:id/best' do
  @pondering = Pondering.find(params[:pondering_id])
  @theory = Theory.find(params[:id])
  @theory.best_theory = true
  if @theory.save
    redirect "/ponderings/#{@pondering.id}"
  else
    @errors = @theory.errors.full_messages
    redirect "/ponderings/#{@pondering.id}"
  end
end
