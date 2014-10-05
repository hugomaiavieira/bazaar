require 'rails_helper'

RSpec.describe Brand, :type => :model do
  describe 'name' do
    it { is_expected.to have_valid(:name).when('Algorich') }
    it { is_expected.to_not have_valid(:name).when('', nil) }
    it 'must be uniq' do
      Brand.create(name: 'Algorich')
      is_expected.to_not have_valid(:name).when('algorich')
    end
  end
end
