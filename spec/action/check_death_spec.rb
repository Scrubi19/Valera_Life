require 'rspec'
require_relative '../../lib/valera'
require_relative '../../lib/action/modification'

RSpec.describe Conditions do
  describe 'decorator' do
    let(:death_from_depression) do
      valera = Modification.next_iteration(Valera.new, '1')
      valera = Modification.next_iteration(valera, '7')
      valera = Modification.next_iteration(valera, '1')
      valera = Modification.next_iteration(valera, '7')
      Modification.next_iteration(valera, '1').stats!['state?']['dead']
    end

    let(:death_from_fatigue) do
      valera = Modification.next_iteration(Valera.new, '1')
      Modification.next_iteration(valera, '4').stats!['state?']['dead']
    end

    let(:expected) do
      true
    end

    context 'Decorator death from depression' do
      it { expect(death_from_depression).to eq expected }
    end

    context 'Decorator death from fatigue' do
      it { expect(death_from_fatigue).to eq expected }
    end
  end
end

