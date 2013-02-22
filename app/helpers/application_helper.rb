module ApplicationHelper
  def nav_link(name, options = {}, html_options = {})
    current = current_page? options
    selected = current ? "selected" : ""
    html_options[:class] = "#{html_options[:class]} #{selected}"
    content_tag "li", link_to(name, controller: options[:controller]), html_options
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

  def facebook_link(html_options = {})
    link = {}
    link[:en] = "https://www.facebook.com/pages/Niki-and-Jazmin/130614283758707?ref=ts&fref=ts"
    link[:hu] = "https://www.facebook.com/pages/Niki-es-Jazmin/410543298980679?ref=ts&fref=ts"
    link[:fi] = "https://www.facebook.com/NikiJaJazmin?fref=ts"
    link_to "", link[I18n.locale], html_options
  end

end
