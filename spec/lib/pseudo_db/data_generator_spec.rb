require 'spec_helper'

describe 'DataGenerator' do
  describe '#username' do
    it 'returns a random username when not passed a seed argument' do
      expect(PseudoDb::DataGenerator.username).to match(/^\w+\d{1,2}$/)
    end

    it 'returns a repeatable username when called with a seed argument' do
      expect(PseudoDb::DataGenerator.username('amleaver')).to eq('wetmask17')
    end
  end

  describe '#postcode' do
    it 'returns a randomized postcode' do
      expect(PseudoDb::DataGenerator.postcode).to match(/^\w{2}\d{1,2} \d\w{2}$/)
    end
  end

  describe '#uk_passport' do
    it 'returns a randomized UK passport number' do
      expect(PseudoDb::DataGenerator.uk_passport).to match(/^\d{10}GBR\d{7}\w\d{7}<{12}\d{2}$/)
    end
  end

  describe '#random_number_string' do
    it 'returns a string composed of random numbers for the specified length' do
      expect(PseudoDb::DataGenerator.random_number_string(1)).to match(/^\d{1}$/)
      expect(PseudoDb::DataGenerator.random_number_string(8)).to match(/^\d{8}$/)
    end
  end

  describe '#random_character_string' do
    it 'returns a string composed of random characters for the specified length' do
      expect(PseudoDb::DataGenerator.random_character_string(1)).to match(/^\w{1}$/)
      expect(PseudoDb::DataGenerator.random_character_string(8)).to match(/^\w{8}$/)
    end
  end
end