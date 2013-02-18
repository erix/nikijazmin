module ApplicationHelper
  def nav_link(name, path)
    controller_name = name.downcase
    current = current_page? :controller => controller_name
    selected = current ? " selected" : ""
    content_tag "li", link_to(name, path), :class => "#{controller_name}#{selected}"
  end
end
