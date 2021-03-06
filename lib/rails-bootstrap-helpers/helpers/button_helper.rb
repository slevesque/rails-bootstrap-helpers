module RailsBootstrapHelpers::Helpers::ButtonHelper
  include RailsBootstrapHelpers::Helpers::OptionsHelper
  include RailsBootstrapHelpers::Helpers::FormTagHelper

  # Renders a Bootstrap button. This method behaves just as "link_to" but will
  # render a Bootstrap button instead of a regular link. Note that this is still
  # an "a" tag and not an "input" tag. In addition to the options "link_to"
  # handles this method also handles the following options:
  #
  # @option options [String, Symbol] :style the style of the button
  # @option options ["large", "small", "mini"] :size the size of the button
  # @option options [Boolean] :disabled (false) if the button should be disabled or not
  # @option options [String] :icon the name of an icon to render on the button
  # @option options ["left", "right"] :icon_position (left) the position of the icon, if present
  #
  # @option options [Boolean] :icon_invert (false) if the color of the icon
  #         should be inverted or not
  def bs_button_to (*args, &block)
    RailsBootstrapHelpers::Renderers::ButtonRenderer.new(self, :link, *args, &block).render
  end

  # Renders an inline Bootstrap button. That is, a small button having only an
  # icon and no text.
  #
  # @param url [String] the URL the button should link to
  # @param icon [String] the icon of the button
  # @param options [Hash] a hash of options. See {#bs_button_to}
  #
  # @see #bs_button_to
  def bs_inline_button_to (url, icon, options = {})
    options = options.reverse_merge icon: icon, size: "mini"
    append_class!(options, "inline")
    RailsBootstrapHelpers::Renderers::ButtonRenderer.new(self, :link, nil, url, options).render
  end

  # Renders a Bootstrap button with a popover.
  #
  # @param name [String] the name/title of the button
  # @param content_or_options [String, Hash] a hash of options if a block is
  #        passed, otherwise the content of the popover
  #
  # @param block [block] a block rendering the content of the popover
  #
  # @option options [String, "bottom", "top", "left", "right"] :position the
  #         position of the popover
  #
  # @see #bs_button_to
  def bs_popover_button (name, content_or_options = nil, options = {}, &block)
    if block_given?
      bs_popover_button(name, capture(&block).gsub("\n", ""), content_or_options || {})
    else
      options = options.deep_dup
      placement = options.delete(:placement)

      if placement
        ActiveSupport::Deprecation.warn "Usage of the option `:placement` is deprecated. Please use the `:position` option instead"
      end

      position = options.delete(:position) || placement || "bottom"

      options = options.reverse_merge data: {
        content: content_or_options,
        toggle: "popover",
        placement: position,
        container: "body"
      }

      bs_button_tag(name, options)
    end
  end

  # Renders a collapsible Bootstrap button. That is, a button when clicked opens
  # a collapsible section.
  #
  # @param text [String] the text of the button
  # @param target [String] a selector matching the
  # @param options [Hash] a hash of options. All options are passed straight
  #        through to the underlying bs_button_to method.
  #
  # @see #bs_button_to
  def bs_collapsible_button (text, target, options = {})
    options = options.dup.reverse_merge :"data-toggle" => "collapse",
      :"data-target" => target

    bs_button_tag text, :button, options
  end

  # Returns a button group. That is, a div tag with the "btn-group" class.
  #
  # @param options [Hash] a hash of options.
  #
  # @option options [Boolean] :vertical (false) if true, appends
  #         the "btn-group-vertical" class
  #
  # @option options [Boolean] :toolbar (false) if true, wraps the group in an
  #         another group with the "btn-toolbar" class
  #
  # All other options are passed to the button group div.
  def button_group (options = {}, &block)
    if toolbar = options.delete(:toolbar)
      append_class!(options, "btn-toolbar")
    else
      append_class!(options, "btn-group")
      append_class!(options, "btn-group-vertical") if options.delete(:vertical)
    end

    content_tag(:div, options, &block)
  end

  # Renders a dropdown button.
  #
  # All options are passed to the underlying button.
  #
  # @param text [String] the text of the button
  #
  # @param url_or_options [String, Hash] if a string, the button will be rendered
  #        as split dropdown button. This argument will be interpreted as the
  #        URL of the button. If an Hash, it will be interpreted as the options
  #        for the button an a normal dropdown button will be rendered.
  #
  # @param options [Hash] if the an URL is passed as the "url_or_options"
  #        argument this will will be interpreted a hash of options. Otherwise
  #        it will be ignored.
  #
  # @param block [Proc] the block should render a the dropdown menu items in the
  #        form of list items with links.
  def bs_dropdown_button_to (text, url_or_options = nil, options = {}, &block)
    RailsBootstrapHelpers::Renderers::DropdownButtonRenderer.
      new(self, text, url_or_options, options, &block).render
  end
end
