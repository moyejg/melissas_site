class Piece < ApplicationRecord
  has_many_attached :images
  has_one_attached :video
end
