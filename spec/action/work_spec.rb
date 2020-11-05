require 'rspec'
require_relative '../../lib/valera'
require_relative '../../lib/action/work'

RSpec.describe Work do
  describe 'decorator' do
    let(:chill_work_valera) do
      Chill.new Work.new Valera.new
    end

    let(:work_reset_expect) do
      { 'fatigue' => 10, 'fun' => 10, 'health' => 100, 'mana' => 0, 'money' => 10,
        'state?' => {
          '1' => true, '2' => true, '3' => true, '4' => true, '5' => true, '6' => true, '7' => true, 'dead' => false
        } }
    end

    context 'Decorator work reset' do
      it {
        chill_work_valera.base_object = Valera.new
        expect(chill_work_valera.stats!).to eq work_reset_expect
      }
    end
  end
end
