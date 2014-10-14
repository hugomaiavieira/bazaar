require 'rails_helper'

RSpec.describe Piece, :type => :model do
  describe 'code' do
    it { is_expected.to have_valid(:code).when('001') }
    it 'must be uniq' do
      piece = create(:piece)
      piece.update(code: 'A1')
      is_expected.to_not have_valid(:code).when('a1')
    end
  end

  describe 'category' do
    it { is_expected.to_not have_valid(:category).when(nil) }
  end

  it '#define_code' do
    piece = create(:piece)
    piece.define_code
    expect(piece.code).to include(piece.id.to_s)
    expect(piece.code).to include(piece.category_id.to_s)
    expect(piece.code.size).to eq(7)
  end

  it 'must define the code on creation' do
    piece = build(:piece)
    expect(piece).to receive(:define_code)
    piece.save!
  end

  it '.redefine_all_codes' do
    pieceA = create(:piece)
    pieceB = create(:piece)
    pieceA.update(code: 'abc')
    pieceB.update(code: '123')
    expect(pieceA.code).to eq('abc')
    expect(pieceB.code).to eq('123')

    Piece.redefine_all_codes
    expect(pieceA.reload.code).to_not eq('abc')
    expect(pieceB.reload.code).to_not eq('123')
  end
end
