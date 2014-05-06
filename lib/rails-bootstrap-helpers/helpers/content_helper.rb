module RailsBootstrapHelpers::Helpers::ContentHelper
  include RailsBootstrapHelpers::Helpers::OptionsHelper

  # Renders a Bootstrap popover.
  #
  # @param title [String] the title of the popover
  # @param content_or_options [String, Hash] the content as a string or options
  #   as a hash when the content is passed in the block
  #
  # @param options [Hash] a hash of options. Not used when the content is
  #   passed as a block
  #
  # @param escape_html [Boolean] indicates if the content should be HTML escaped
  # @param block [Block] the content, if not passed as the second parameter
  #
  # @option content_or_options [String, Symbol] :position the position of the popover
  def popover (title, content_or_options = nil, options = {}, escape_html = true, &block)
    if block_given?
      popover(title, capture(&block).gsub("\n", ''), content_or_options || {}, false)
    else
      options = options.deep_dup
      append_class! options, 'popover'

      if (position = options.delete(:position) || 'right')
        append_class! options, position
      end

      content = content_or_options
      content = content.html_safe unless escape_html

      content_tag :div, options do
        content_tag(:div, nil, class: 'arrow') +
        content_tag(:h3, title, class: 'popover-title') +
        content_tag(:div, content, class: 'popover-content')
      end
    end
  end
end
