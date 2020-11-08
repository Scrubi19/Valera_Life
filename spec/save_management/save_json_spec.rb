require 'rspec'
require_relative '../../lib/save_management/save_json'
require_relative '../../lib/save_management/load_json'

RSpec.describe SaveJSON do
  describe 'save stats to JSON' do
    let(:before_save) do
      Work.new Chill.new Valera.new
    end

    let(:after_save) do
      Valera.new
    end

    context 'check stats before saving and after saving' do
      it {
        save = SaveJSON.new(before_save)
        save.create_save('test')
        load = LoadJSON.new('test')
        load.load_file(after_save)
        expect(before_save.stats!).to eq after_save.stats!
      }
    end
  end
end
