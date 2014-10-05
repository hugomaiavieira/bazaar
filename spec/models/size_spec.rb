require 'rails_helper'

RSpec.describe Size, :type => :model do
  describe 'name' do
    it { is_expected.to have_valid(:name).when('P') }
    it { is_expected.to_not have_valid(:name).when('', nil) }
    it 'mumist be uniq' do
      Size.create(name: 'M')
      is_expected.to_not have_valid(:name).when('m')
    end
  end
end
