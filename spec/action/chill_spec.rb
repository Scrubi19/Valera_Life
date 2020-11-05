require 'rspec'
require_relative '../../lib/valera'
require_relative '../../lib/action/chill'

RSpec.describe Chill do
  describe 'decorator' do
    let(:work_chill_valera) do
      Work.new Chill.new Valera.new
    end

    let(:chill_reset_expect) do
      { 'fatigue' => 70, 'fun' => 5, 'health' => 100, 'mana' => 0, 'money' => 110,
        'state?' => {
          '1' => true, '2' => true, '3' => true, '4' => true, '5' => true, '6' => true, '7' => true, 'dead' => false
        } }
    end

    context 'Decorator chill reset' do
      it {
        work_chill_valera.base_object = Valera.new
        expect(work_chill_valera.stats!).to eq chill_reset_expect
      }
    end
  end
end
