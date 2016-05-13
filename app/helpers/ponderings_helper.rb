helpers do
  def sorted_ponderings
    Pondering.all.sort_by {|pondering| pondering.created_at}.reverse
  end
end
