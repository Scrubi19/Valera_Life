require 'rspec'
require_relative '../../lib/valera'
require_relative '../../lib/action/singing_subway'

RSpec.describe SingingSubway do
  describe 'decorator' do
    let(:valera_singing_subway) do
      SingingSubway.new Valera.new
    end

    let(:singing_reset_expect) do
      { 'fatigue' => 20, 'fun' => 10, 'health' => 100, 'mana' => 10, 'money' => 20,
        'state?' => {
          '1' => true, '2' => true, '3' => true, '4' => true, '5' => true, '6' => true, '7' => true, 'dead' => false
        } }
    end

    context 'Decorator singing subway reset' do
      it {
        valera_singing_subway.base_object = Valera.new
        expect(valera_singing_subway.stats!).to eq singing_reset_expect
      }
    end
  end
end
