require 'spec_helper'

describe Country do
  let(:valid_name) { 'Qatar' }
  let(:invalid_name) { 'Qutar' }

  describe 'for_autocomplete' do
    it 'returns country with accurate request' do
      data = Country.for_autocomplete(valid_name)
      assert_equal(data.count, 1)
      assert_equal(data.first.name, valid_name)
    end

    it 'returns country with not accurate request' do
      data = Country.for_autocomplete(invalid_name)
      assert_equal(data.count, 1)
      assert_equal(data.first.name, valid_name)
    end
  end

  describe 'text_search' do
    it 'returns country with accurate request' do
      data = Country.text_search(valid_name)
      assert_equal(data.count, 1)
      assert_equal(data.first.name, valid_name)
    end

    it 'returns country with not accurate request' do
      data = Country.text_search(invalid_name)
      assert_equal(data.count, 1)
      assert_equal(data.first.name, valid_name)
    end

    it 'returns empty result' do
      data = Country.text_search('Pickle Rick')
      assert_equal(data.count, 0)
    end
  end

  describe 'trgm_search' do
    it 'shows difference between 0.1 and 0.3 similarities' do
      submit_data = Country.text_search('land').count
      autocomplete_data = Country.for_autocomplete('land').count
      assert_equal(autocomplete_data - submit_data > 0, true)
    end
  end
end
