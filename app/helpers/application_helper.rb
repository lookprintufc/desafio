module ApplicationHelper

  def menu_open(url)
    return "open" if request.original_fullpath == url
  end

end
