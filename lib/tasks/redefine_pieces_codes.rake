namespace :app do
  desc 'Redefine all Pieces codes'
  task redefine_pieces_codes: :environment do
    Piece.redefine_all_codes
  end
end