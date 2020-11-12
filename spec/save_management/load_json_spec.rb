require 'rspec'
require_relative '../../lib/save_management/save_json'
require_relative '../../lib/save_management/load_json'

RSpec.describe LoadJSON do
  describe 'load stats from JSON' do
    let(:load_stats) do
      Valera.new
    end

    let(:after_load_expect) do
      Work.new Chill.new Valera.new
    end

    context 'check stats before loading and after loading' do
      it {
        load = LoadJSON.new('test/test')
        load.load_file(load_stats)
        expect(load_stats.stats!).to eq after_load_expect.stats!
      }
    end
  end
end
