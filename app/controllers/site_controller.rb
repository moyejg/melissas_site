class SiteController < ApplicationController
  def gallery
    @pieces = Piece.all
  end

  def modal
    @piece = Piece.find_by(params[:id])
  end

  def dashboard
    @piece = Piece.new
    @users = User.all
  end

end
