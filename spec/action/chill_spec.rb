require 'rspec'
require_relative '../../lib/valera'
require_relative '../../lib/action/chill'

RSpec.describe Chill do
  describe 'decorator' do
    let(:work_chill_valera) do
      Work.new Chill.new Valera.new
    end

    let(:chill_reset_expect) { { 'health' => 100, 'mana' => -30, 'fun' => -5, 'fatigue' => 70, 'money' => 100 } }

    context 'Decorator chill reset' do
      it {
        work_chill_valera.base_object = Valera.new
        expect(work_chill_valera.stats!).to eq chill_reset_expect
      }
    end
  end
end
