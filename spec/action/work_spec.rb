require 'rspec'
require_relative '../../lib/valera'
require_relative '../../lib/action/work'

RSpec.describe Work do
  describe 'decorator' do
    let(:chill_work_valera) do
      Chill.new Work.new Valera.new
    end

    let(:work_reset_expect) { { 'health' => 100, 'mana' => -10, 'fun' => -5, 'fatigue' => 10, 'money' => 0 } }

    context 'Decorator work reset' do
      it {
        chill_work_valera.base_object = Valera.new
        expect(chill_work_valera.stats!).to eq work_reset_expect
      }
    end
  end
end
