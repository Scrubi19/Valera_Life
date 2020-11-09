require 'rspec'
require_relative '../../lib/valera'
require_relative '../../lib/action/sleep'
require_relative '../../lib/action/modification'

RSpec.describe Sleep do
  describe 'decorator' do
    let(:actual) do
      Modification.next_iteration(Valera.new, '7').stats!
    end

    let(:expected) do
      { 'fatigue' => 0, 'fun' => 7, 'health' => 100, 'mana' => 0, 'money' => 10,
        'state?' => {
          '1' => true, '2' => true, '3' => true, '4' => true, '5' => true, '6' => true, '7' => true, 'dead' => false
        } }
    end

    context 'Decorator sleep reset' do
      it {
        expect(actual).to eq expected
      }
    end
  end
end
