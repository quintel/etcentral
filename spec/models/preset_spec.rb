require 'spec_helper'

describe Preset do

  describe '#find' do

    let(:preset) { Preset.find(:camp) }

    it 'finds Frans' do
      expect(preset).to_not be_nil
    end

    it 'stores info about Frans' do
      expect(preset.key).to            eq :camp
      expect(preset.name).to           eq 'Frans van Camp'
      expect(preset.function['nl']).to eq 'Super Intern'
    end

  end

end
