require 'rspec'
require_relative '../../lib/valera'
require_relative '../../lib/action/sleep'

RSpec.describe Sleep do
  describe 'decorator' do
    let(:valera_sleep) do
      Sleep.new Valera.new
    end

    let(:sleep_reset_expect) { { 'health' => 190, 'mana' => -50, 'fun' => 0, 'fatigue' => -70, 'money' => 0 } }

    context 'Decorator sleep reset' do
      it {
        valera_sleep.base_object = Valera.new
        expect(valera_sleep.stats!).to eq sleep_reset_expect
      }
    end
  end
end
