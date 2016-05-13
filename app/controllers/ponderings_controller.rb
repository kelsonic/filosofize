get '/ponderings/new' do
  logged_in?
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
  # logged_in?
  @pondering = Pondering.find(params[:id])
  erb :'ponderings/show'
end

get '/ponderings' do
  # logged_in?
  @ponderings = sorted_ponderings
  erb :'ponderings/index'
end

post '/ponderings/:id/upvote' do
  logged_in?
  @pondering = Pondering.find(params[:id])
  @upvote = @pondering.upvotes.new(filosofer_id: current_user.id)

  if @upvote.save
    if request.xhr?
      return (@pondering.upvotes.size - @pondering.downvotes.size).to_s
    end
    redirect "/ponderings/#{@pondering.id}"
  else

    @errors = @upvote.errors.full_messages
    if request.xhr?
      return "Already Voted"
    end
    redirect "/ponderings/#{@pondering.id}"
  end
end

post '/ponderings/:id/downvote' do
  logged_in?
  @pondering = Pondering.find(params[:id])
  @downvote = @pondering.downvotes.new(filosofer_id: current_user.id)

  if @downvote.save
    if request.xhr?
      return (@pondering.upvotes.size - @pondering.downvotes.size).to_s
    end
    redirect "/ponderings/#{@pondering.id}"
  else

    @errors = @downvote.errors.full_messages
    if request.xhr?
      return "Already Voted"
    end
    redirect "/ponderings/#{@pondering.id}"
  end
end
