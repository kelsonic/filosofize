helpers do
  def logged_in?
    redirect '/' unless current_user
  end
end
