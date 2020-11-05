require 'rspec'
require_relative '../../lib/valera'
require_relative '../../lib/action/go_bar'

RSpec.describe GoBar do
  describe 'decorator' do
    let(:work_bar_valera) do
      WineSerial.new GoBar.new Valera.new
    end

    let(:bar_reset_expect) do
      { 'fatigue' => 10, 'fun' => 9, 'health' => 95, 'mana' => 30, 'money' => 0,
        'state?' => {
          '1' => true, '2' => true, '3' => true, '4' => true, '5' => true, '6' => true, '7' => true, 'dead' => false
        } }
    end

    context 'Decorator bar reset' do
      it {
        work_bar_valera.base_object = Valera.new
        expect(work_bar_valera.stats!).to eq bar_reset_expect
      }
    end
  end
end
