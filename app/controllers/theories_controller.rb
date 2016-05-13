get "/ponderings/:id/theories/new" do
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
