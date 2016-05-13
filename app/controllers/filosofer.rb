get '/filosofer' do

  @filosofer = Filosofer.all #define instance variable for view

  erb :'filosofer/index' #show all filosofer view (index)

end

get '/filosofers/new' do
  erb :'filosofer/new'
end

post '/filosofer' do

  #below works with properly formatted params in HTML form
  @filosofer = Filosofer.new(params[:filosofer]) #create new filosofer

  if @filosofer.save #saves new filosofer or returns false if unsuccessful
    redirect '/filosofer' #redirect back to filosofer index page
  else
    @errors = @filosofer.errors.full_messages
    erb :'filosofer/new' # show new filosofer view again(potentially displaying errors)
  end

end

get '/filosofer/:id' do

  #gets params from url

  @filosofer = Filosofer.find(params[:id]) #define instance variable for view

  erb :'filosofer/show' #show single filosofer view

end

get '/filosofer/:id/edit' do

  #get params from url
  @filosofer = Filosofer.find(params[:id]) #define intstance variable for view

  erb :'filosofer/edit' #show edit filosofer view

end

put '/filosofer/:id' do

  #get params from url
  @filosofer = Filosofer.find(params[:id]) #define variable to edit

  @filosofer.assign_attributes(params[:filosofer]) #assign new attributes

  if @filosofer.save #saves new filosofer or returns false if unsuccessful
    redirect '/filosofer' #redirect back to filosofer index page
  else
    erb :'filosofer/edit' #show edit filosofer view again(potentially displaying errors)
  end

end

delete '/filosofer/:id' do

  #get params from url
  @filosofer = Filosofer.find(params[:id]) #define filosofer to delete

  @filosofer.destroy #delete filosofer

  redirect '/filosofer' #redirect back to filosofer index page

end


