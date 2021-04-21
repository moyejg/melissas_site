class Piece < ApplicationRecord
  before_save :falsify_all_other_piece_showcase
  
  has_many_attached :images
  has_one_attached :showcase_image
  has_one_attached :video

  attr_accessor :new_images

  paginates_per 12

  def falsify_all_other_piece_showcase
    self.class.where('id != ? and showcase', self.id).update_all("showcase = 'false'")
  end
end
