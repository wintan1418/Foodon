module ApplicationHelper
    class BootstrapPagination < WillPaginate::ActionView::LinkRenderer
      def to_html
        list_items = pagination.map do |item|
          case item
          when Integer
            page_number(item)
          else
            send(item)
          end
        end.join(@options[:link_separator])
        tag(:ul, list_items.html_safe, class: "pagination justify-content-center")
      end
  
      def page_number(page)
        if page == current_page
          tag(:li, tag(:span, page, class: "page-link"), class: "page-item active")
        else
          tag(:li, link(page, page, rel: rel_value(page), class: "page-link"), class: "page-item")
        end
      end
  
      def previous_or_next_page(page, text, classname)
        if page
          tag(:li, link(text, page, class: "page-link"), class: "page-item")
        else
          tag(:li, tag(:span, text, class: "page-link"), class: "page-item disabled")
        end
      end
  
      def gap
        tag(:li, tag(:span, "&hellip;", class: "page-link"), class: "page-item disabled")
      end
    end
  end
  