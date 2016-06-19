class TabBuilder < TabsOnRails::Tabs::Builder
  def open_tabs(options = {})
    @context.tag("ul", options, open = true)
  end

  def close_tabs(options = {})
    "</ul>".html_safe
  end

  def tab_for(tab, label = nil, path = '#', item_options = {}, &block)
    item_options[:class] = (current_tab?(tab) ? 'active' : '')
    @context.content_tag(:li, item_options) do
      @context.link_to(path) do
        html = ''.html_safe
        if block_given?
          html += @context.capture(&block)
        else
          html += ('&nbsp' + label).html_safe
        end
        html
      end
    end
  end
end
