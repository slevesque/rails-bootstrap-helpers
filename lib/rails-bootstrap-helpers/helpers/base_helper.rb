module RailsBootstrapHelpers::Helpers::BaseHelper
  include RailsBootstrapHelpers::Helpers::OptionsHelper

  # Renders the given icon
  #
  # Renders an <tt>i</tt> tag with the class "icon-#{icon}"
  #
  # @param icon [String, Symbol] the kind of icon to render
  #
  # @option options [Boolean] :invert (false) if the color of the icon should be inverted
  def icon (icon, options = {})
    options = options.dup

    icon = ERB::Util.html_escape(icon.to_s)
    #TODO: Add configuration option to switch between glyphicon and
    #font-awesome
    append_class!(options, "fa fa-" + icon)

    if options.has_key?(:text)
      content_tag(:span) do
        content_tag(:span, nil, class: options[:class]) +
        " " + options[:text]
      end
    else
      content_tag(:span, nil, class: options[:class])
    end
    # if options.delete(:invert)
    #   append_class!(options, "icon-white")
    # end

    # content_tag :span, nil, class: options[:class]
  end

  def fa_icon(icon, options={})
    options = options.dup

    icon = ERB::Util.html_escape(icon.to_s)
    append_class!(options, "fa fa-" + icon)

    if options.has_key?(:text)
      content_tag(:span) do
        content_tag(:span, nil, class: options[:class]) +
        " " + options[:text]
      end
    else
      content_tag(:span, nil, class: options[:class])
    end
  end

  # Renders the given Iconic icon.
  #
  # This is the Iconic icons from Jasny Bootstrap.
  # Renders an <tt>i</tt> tag with the class "iconic-#{icon}"
  #
  # @param icon [String, Symbol] the kind of icon to render
  #
  # @option options [String, Symbol] :color the CSS color of the icon
  # @option options [String, Symbol, Number] :size the CSS font size of the icon
  #
  # @option options [:warning, :error, :info, :success, :muted] :bs_style
  #         the Bootstrap style to render the icon in
  #
  # @option options [:primary, :info, :success, :warning, :danger] :action_style
  #         renders the icon with this action link style
  def iconic_icon (icon, options = {})
    RailsBootstrapHelpers::Renderers::IconicIconRenderer.new(self, icon, options).render
  end
end
