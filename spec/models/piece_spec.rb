require 'rails_helper'

RSpec.describe Piece, :type => :model do
  describe 'code' do
    it { is_expected.to have_valid(:code).when('001') }
    it { is_expected.to_not have_valid(:code).when('', nil) }
    it 'must be uniq' do
      piece = create(:piece)
      piece.update(code: 'A1')
      is_expected.to_not have_valid(:code).when('a1')
    end
  end

  describe 'category' do
    it { is_expected.to_not have_valid(:category).when(nil) }
  end

  it 'code definition' do
    piece = create(:piece)
    expect(piece.code).to include(piece.id.to_s)
    expect(piece.code).to include(piece.category_id.to_s)
    expect(piece.code.size).to eq(10)
  end
end
