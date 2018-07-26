module RailsBootstrapHelpers::Renderers
  class ButtonRenderer < AbstractLinkRenderer
    include RailsBootstrapHelpers::Helpers::BaseHelper

    def render
      append_class "btn"
      append_style
      append_size
      append_disabled
      append_icon

      super
    end

    private

    def append_style
      if (style = has_option?("style"))
        append_class "btn-" + style.to_s
      else
        append_class "btn-outline-secondary"
      end
    end

    def append_size
      if size = has_option?("size")
        append_class "btn-" + size.to_s
      end
    end

    def append_disabled
      if disabled = has_option?("disabled")
        append_class "disabled"
      end
    end

    def append_icon
      if icon = has_option?("icon")
        pos = has_option?("icon_position")
        icon_args = [icon, invert: has_option?("icon_invert")]

        if pos.to_s == "right"
          self.text = self.text.to_s + " " + icon(*icon_args)
        else
          self.text = icon(*icon_args) + " " + self.text.to_s
        end

        self.text = self.text.html_safe
      else
        strip_unused_options!
      end
    end

    def strip_unused_options!
      has_option?("icon_position")
      has_option?("icon_invert")
    end
  end
end
