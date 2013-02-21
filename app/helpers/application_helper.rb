module ApplicationHelper
  def nav_link(name, options)
    current = current_page? options
    selected = current ? "selected" : ""
    content_tag "li", link_to(name, controller: options[:controller]), :class => "#{options[:class]} #{selected}"
  end

  def dat_markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true, :no_intra_emphasis => true)
    markdown.render(text).html_safe
  end

  def store_badge(product)
    if product.store_link
      badge = product.app? ? "AppStore.svg" : "iBookstore.svg"
      content_tag "div", link_to(image_tag(badge), product.store_link), class: "store-link"
    end
  end

  def get_locale
    I18n.default_locale;
  end
end
