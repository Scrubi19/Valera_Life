require 'rspec'
require_relative '../../lib/save_management/save_json'
require_relative '../../lib/save_management/load_json'

RSpec.describe Conditions do
  describe 'save stats to JSON' do
    let(:filename) do
      allow($stdin).to receive(:gets).and_return('test/test_menu')
      $stdin.gets
    end

    let(:test_save) do
      valera = Modification.next_iteration(Valera.new, '1')
      Modification.next_iteration(valera, '8', filename)
    end

    let(:test_load) do
      empty_valera = Valera.new
      Modification.next_iteration(empty_valera, '9', filename)
    end

    context 'check stats after saving from loading valera' do
      it {
        expect(test_save.stats!).to eq test_load.stats!
      }
    end
  end
end
