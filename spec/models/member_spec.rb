require 'rails_helper'

RSpec.describe Member, :type => :model do
  describe 'name' do
    it { is_expected.to have_valid(:name).when('Caru') }
    it { is_expected.to_not have_valid(:name).when('', nil) }
  end

  describe 'email' do
    it { is_expected.to have_valid(:email).when('caru@umsonhodebazar.com.br') }
    it { is_expected.to_not have_valid(:email).when('', nil) }
  end

  describe 'phone' do
    it { is_expected.to have_valid(:phone).when('(22) 2724-2424') }
    it { is_expected.to_not have_valid(:phone).when('', nil) }
  end

  describe 'tax' do
    it { is_expected.to have_valid(:tax).when(0, 40, 100) }
    it { is_expected.to_not have_valid(:tax).when('', nil, 4.5, -1, 101) }
  end
end
