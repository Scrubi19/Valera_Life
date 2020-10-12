require 'rspec'
require_relative '../../lib/valera'
require_relative '../../lib/action/wine_serial'

RSpec.describe WineSerial do
  describe 'decorator' do
    let(:bar_wine_valera) do
      GoBar.new WineSerial.new Valera.new
    end

    let(:wine_reset_expect) { { 'fatigue' => 40, 'fun' => 1, 'health' => 90, 'mana' => 60, 'money' => -100 } }

    context 'Decorator wine_serial reset' do
      it {
        bar_wine_valera.base_object = Valera.new
        expect(bar_wine_valera.stats!).to eq wine_reset_expect
      }
    end
  end
end
