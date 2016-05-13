get '/ponderings/:id' do
  @pondering = Pondering.find(params[:id])
  erb :'pondering/show'
end
