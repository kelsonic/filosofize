# get '/filosofers' do
#   logged_in?
#   @filosofer = Filosofer.all #define instance variable for view
#   erb :'filosofers/index' #show all filosofer view (index)
# end

get '/filosofers/new' do
  erb :'filosofers/new'
end

post '/filosofers' do

  #below works with properly formatted params in HTML form
  @filosofer = Filosofer.new(params[:filosofer]) #create new filosofer

  if @filosofer.save #saves new filosofer or returns false if unsuccessful
    redirect "/filosofers/#{@filosofer.id}" #redirect back to filosofer index page
  else
    @errors = @filosofer.errors.full_messages
    erb :'filosofers/new' # show new filosofer view again(potentially displaying errors)
  end

end

get '/filosofers/:id' do
  logged_in?
  @filosofer = Filosofer.find(params[:id]) #define instance variable for view
  erb :'filosofers/show' #show single filosofer view
end

# get '/filosofers/:id/edit' do
#   logged_in?
#   @filosofer = Filosofer.find(params[:id]) #define intstance variable for view
#   erb :'filosofers/edit' #show edit filosofer view
# end

# put '/filosofers/:id' do
#   @filosofer = Filosofer.find(params[:id]) #define variable to edit
#   @filosofer.assign_attributes(params[:filosofer]) #assign new attributes
#   if @filosofer.save #saves new filosofer or returns false if unsuccessful
#     redirect '/filosofers' #redirect back to filosofer index page
#   else
#     erb :'filosofers/edit' #show edit filosofer view again(potentially displaying errors)
#   end
# end

# delete '/filosofers/:id' do
#   @filosofer = Filosofer.find(params[:id]) #define filosofer to delete
#   @filosofer.destroy #delete filosofer
#   redirect '/filosofers' #redirect back to filosofer index page
# end


