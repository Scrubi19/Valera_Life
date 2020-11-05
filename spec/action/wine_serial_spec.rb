require 'rspec'
require_relative '../../lib/valera'
require_relative '../../lib/action/wine_serial'

RSpec.describe WineSerial do
  describe 'decorator' do
    let(:bar_wine_valera) do
      GoBar.new WineSerial.new Valera.new
    end

    let(:wine_reset_expect) do
      { 'fatigue' => 0, 'fun' => 9, 'health' => 90, 'mana' => 0, 'money' => 0,
        'state?' => {
          '1' => true, '2' => true, '3' => true, '4' => true, '5' => true, '6' => true, '7' => true, 'dead' => false
        } }
    end

    context 'Decorator wine serial reset' do
      it {
        bar_wine_valera.base_object = Valera.new
        expect(bar_wine_valera.stats!).to eq wine_reset_expect
      }
    end
  end
end
