require 'rspec'
require_relative '../../lib/valera'
require_relative '../../lib/action/sleep'

RSpec.describe Sleep do
  describe 'decorator' do
    let(:valera_sleep) do
      Sleep.new Valera.new
    end

    let(:sleep_reset_expect) do
      { 'fatigue' => 0, 'fun' => 7, 'health' => 100, 'mana' => 0, 'money' => 10,
        'state?' => {
          '1' => true, '2' => true, '3' => true, '4' => true, '5' => true, '6' => true, '7' => true, 'dead' => false
        } }
    end

    context 'Decorator sleep reset' do
      it {
        valera_sleep.base_object = Valera.new
        expect(valera_sleep.stats!).to eq sleep_reset_expect
      }
    end
  end
end
