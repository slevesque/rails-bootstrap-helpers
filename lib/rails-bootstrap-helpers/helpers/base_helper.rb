require 'action_view'

module RailsBootstrapHelpers::Helpers::BaseHelper
  include ActionView::Helpers::TagHelper
  include RailsBootstrapHelpers::Helpers::OptionsHelper

  attr_accessor :output_buffer

  # Set the icon_set
  def icon_set(options)
    return :fas if !options.has_key?(:icon_set)
    options[:icon_set]
  end

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

    append_class!(options, "#{icon_set(options)} fa-" + icon)

    if options.has_key?(:text)
      content_tag(:span) do
        content_tag(:span, nil, class: options[:class]) +
          " #{options[:text]}".html_safe
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
