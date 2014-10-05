require 'rails_helper'

RSpec.describe Piece, :type => :model do
  describe 'code' do
    it { is_expected.to have_valid(:code).when('001') }
    it { is_expected.to_not have_valid(:code).when('', nil) }
    it 'must be uniq' do
      create(:piece, code: 'A1')
      is_expected.to_not have_valid(:code).when('a1')
    end
  end

  describe 'category' do
    it { is_expected.to_not have_valid(:category).when(nil) }
  end
end
