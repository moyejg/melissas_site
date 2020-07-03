class Piece < ApplicationRecord
  has_many_attached :images
  has_one_attached :showcase_image
  has_one_attached :video

  attr_accessor :new_images
end
