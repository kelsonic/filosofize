get '/comment/new' do
  @errors = []
  erb :'comment/new'
end

post '/comment' do

  @comment = Comment.new(params[:comment]) #create new comment

  if @comment.save
    redirect '/comment' # <-- go back to the page we were commenting from ???
  else
    @errors = @comment.errors.full_messages
    erb :'comment/new'
  end

end

