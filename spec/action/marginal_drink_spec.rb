require 'rspec'
require_relative '../../lib/valera'
require_relative '../../lib/action/marginal_drink'
require_relative '../../lib/action/modification'

RSpec.describe MarginalDrink do
  describe 'decorator' do
    let(:actual) do
      Modification.next_iteration(Valera.new, '6').stats!
    end

    let(:expected) do
      { 'fatigue' => 80, 'fun' => 10, 'health' => 20, 'mana' => 80, 'money' => 0,
        'state?' => {
          '1' => true, '2' => true, '3' => true, '4' => true, '5' => true, '6' => true, '7' => true, 'dead' => false
        } }
    end

    context 'Decorator marginal drinking reset' do
      it {
        expect(actual).to eq expected
      }
    end
  end
end
