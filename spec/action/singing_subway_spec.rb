require 'rspec'
require_relative '../../lib/valera'
require_relative '../../lib/action/singing_subway'

RSpec.describe SingingSubway do
  describe 'decorator' do
    let(:valera_singing_subway) do
      SingingSubway.new Valera.new
    end

    let(:singing_reset_expect) { { 'health' => 100, 'mana' => 10, 'fun' => 1, 'fatigue' => 20, 'money' => 10 } }

    context 'Decorator singing subway reset' do
      it {
        valera_singing_subway.base_object = Valera.new
        expect(valera_singing_subway.stats!).to eq singing_reset_expect
      }
    end
  end
end
