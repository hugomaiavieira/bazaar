require 'rails_helper'

RSpec.describe Category, :type => :model do
  describe 'name' do
    it { is_expected.to have_valid(:name).when('Sapato') }
    it { is_expected.to_not have_valid(:name).when('', nil) }
    it 'must be uniq' do
      Category.create(name: 'Sapato')
      is_expected.to_not have_valid(:name).when('sapato')
    end
  end
end
