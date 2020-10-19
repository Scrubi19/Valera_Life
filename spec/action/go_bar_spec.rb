require 'rspec'
require_relative '../../lib/valera'
require_relative '../../lib/action/go_bar'

RSpec.describe GoBar do
  describe 'decorator' do
    let(:work_bar_valera) do
      WineSerial.new GoBar.new Valera.new
    end

    let(:bar_reset_expect) { { 'fatigue' => 10, 'fun' => -1, 'health' => 95, 'mana' => 30, 'money' => -20 } }

    context 'Decorator bar reset' do
      it {
        work_bar_valera.base_object = Valera.new
        expect(work_bar_valera.stats!).to eq bar_reset_expect
      }
    end
  end
end
