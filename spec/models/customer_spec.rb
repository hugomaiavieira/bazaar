require 'rails_helper'

RSpec.describe Customer, :type => :model do
  describe 'name' do
    it { is_expected.to have_valid(:name).when('Caru') }
    it { is_expected.to_not have_valid(:name).when('', nil) }
  end
end
