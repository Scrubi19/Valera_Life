require 'rspec'
require_relative '../../lib/valera'
require_relative '../../lib/action/go_bar'
require_relative '../../lib/action/modification'

RSpec.describe GoBar do
  describe 'decorator' do
    let(:actual) do
      Modification.next_iteration(Valera.new, '4').stats!
    end

    let(:expected) do
      { 'fatigue' => 40, 'fun' => 10, 'health' => 90, 'mana' => 60, 'money' => 0,
        'state?' => {
          '1' => true, '2' => true, '3' => true, '4' => true, '5' => true, '6' => true, '7' => true, 'dead' => false
        } }
    end

    context 'Decorator bar reset' do
      it {
        expect(actual).to eq expected
      }
    end
  end
end
