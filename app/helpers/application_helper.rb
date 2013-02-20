module ApplicationHelper
  def nav_link(name, path)
    controller_name = name.downcase
    current = current_page? :controller => controller_name
    selected = current ? " selected" : ""
    content_tag "li", link_to(name, path), :class => "#{controller_name}#{selected}"
  end

  def dat_markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true, :no_intra_emphasis => true)
    markdown.render(text).html_safe
  end
end
