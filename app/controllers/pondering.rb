get '/ponderings/:id' do
  @pondering = Pondering.find(params[:id])
end
