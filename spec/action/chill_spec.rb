require 'rspec'
require_relative '../../lib/valera'
require_relative '../../lib/action/chill'
require_relative '../../lib/action/modification'

RSpec.describe Chill do
  describe 'decorator' do
    let(:actual) do
      Modification.next_iteration(Valera.new, '2').stats!
    end

    let(:expected) do
      { 'fatigue' => 10, 'fun' => 10, 'health' => 100, 'mana' => 0, 'money' => 10,
        'state?' => {
          '1' => true, '2' => true, '3' => true, '4' => true, '5' => true, '6' => true, '7' => true, 'dead' => false
        } }
    end

    context 'Decorator chill reset' do
      it {
        expect(actual).to eq expected
      }
    end
  end
end
