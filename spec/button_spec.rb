require 'spec_helper'

RSpec.describe ButtonHelperSpec, type: :helper do
  describe '#favicon' do
    it 'get favicon tag' do
      expect(helper.favicon).to match tag(:link, 'rel': 'icon', 'href': '/favicon.ico')
    end
  end
end
