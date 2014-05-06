require "spec_helper"

describe RailsBootstrapHelpers::Helpers::ContentHelper do
  describe "popover" do
    let(:expected_content) { "Content" }
    let(:position) { "right" }

    let(:expected_html) do
      html = <<-eos
<div class="popover #{position}">
  <div class="arrow">
  </div>
  <h3 class="popover-title">Foo</h3>
  <div class="popover-content">#{expected_content}</div>
</div>
  eos

      strip_expected(html)
    end

    it "renders a popover" do
      popover("Foo", "Content").should == expected_html
    end

    context "when content contains HTML" do
      let(:expected_content) { "&lt;p&gt;Content&lt;/p&gt;" }

      it "escapes the HTML content" do
        popover("Foo", "<p>Content</p>").should == expected_html
      end

      context "when escape_html is disabled" do
        let(:expected_content) { "<p>Content</p>" }

        it "does not escape the HTML content" do
          popover("Foo", expected_content, {}, false).should == expected_html
        end
      end
    end

    context "when using a block" do
      let(:expected_content) { "<p>Content</p>" }

      it "renders a popover without escaping HTML" do
        html = popover "Foo" do
          content_tag :p, "Content"
        end

        html.should == expected_html
      end
    end

    context "with position" do
      let(:position) { "left" }

      it "renders the popover with the given position" do
        popover("Foo", expected_content, position: position).should == expected_html
      end
    end
  end
end
