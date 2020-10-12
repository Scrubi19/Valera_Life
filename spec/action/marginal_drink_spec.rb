require 'rspec'
require_relative '../../lib/valera'
require_relative '../../lib/action/marginal_drink'

RSpec.describe MarginalDrink do
  describe 'decorator' do
    let(:marginal_marginal_valera) do
      MarginalDrink.new MarginalDrink.new Valera.new
    end

    let(:marginal_reset_expect) { { 'fatigue' => 80, 'fun' => 5, 'health' => 20, 'mana' => 90, 'money' => -150 } }

    context 'Decorator marginal drinking reset' do
      it {
        marginal_marginal_valera.base_object = Valera.new
        expect(marginal_marginal_valera.stats!).to eq marginal_reset_expect
      }
    end
  end
end
