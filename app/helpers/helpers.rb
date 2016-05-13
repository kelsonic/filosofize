helpers do
  def current_user
    Filosofer.find_by(id: session[:id])
  end
end
