module ApplicationHelper
  # Determines if the nav bar link should be highlighted based on current page
  def nav_link_class(path)
    current_page?(path) ? "nav-link text-info" : "nav-link"
  end
end
