require 'spec_helper'

class DummyBaseHelper
  include RailsBootstrapHelpers::Helpers::BaseHelper
end

RSpec.describe DummyBaseHelper, type: :helper do
  describe '#icon_set' do
    subject { described_class.new.icon_set(options) }
  end
    
  describe '#icon' do
    subject { described_class.new.icon(:pencil, text: text) }

    let(:text) { nil }

    it {
      is_expected.to eq('<span class="fal fa-pencil"></span>')
    }

    context 'with text' do
      let(:text) { 'FooBar' }
    
      it { is_expected.to eq('<span class="fal fa-pencil"> FooBar</span>') }
    end
  end
end
