require 'rspec'
require_relative '../lib/action/work'
require_relative '../lib/action/chill'
require_relative '../lib/valera'

RSpec.describe Valera do
  describe 'decorator' do
    let(:valera) { Valera.new }
    let(:chill_work_valera) do
      work_valera = Work.new valera
      Chill.new work_valera
    end
    let(:chill_reset_expect) { { 'health' => 100, 'mana' => -10, 'fun' => -5, 'fatigue' => 10, 'money' => 0 } }
    let(:work_chill_valera) do
      chill_valera = Chill.new valera
      Work.new chill_valera
    end
    let(:work_reset_expect) { { 'fatigue' => 70, 'fun' => -5, 'health' => 100, 'mana' => -30, 'money' => 100 } }

    context 'Decorator work reset' do
      it {
        chill_work_valera.base_object = valera
        expect(chill_work_valera.stats!).to eq chill_reset_expect
      }
    end

    context 'Decorator chill reset' do
      it {
        work_chill_valera.base_object = valera
        expect(work_chill_valera.stats!).to eq work_reset_expect
      }
    end
  end
end
