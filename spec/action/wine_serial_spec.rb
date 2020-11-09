require 'rspec'
require_relative '../../lib/valera'
require_relative '../../lib/action/wine_serial'
require_relative '../../lib/action/modification'

RSpec.describe WineSerial do
  describe 'decorator' do
    let(:actual) do
      Modification.next_iteration(Valera.new, '3').stats!
    end

    let(:expected) do
      { 'fatigue' => 10, 'fun' => 9, 'health' => 95, 'mana' => 30, 'money' => 0,
        'state?' => {
          '1' => true, '2' => true, '3' => true, '4' => true, '5' => true, '6' => true, '7' => true, 'dead' => false
        } }
    end

    context 'Decorator wine serial reset' do
      it {
        expect(actual).to eq expected
      }
    end
  end
end
