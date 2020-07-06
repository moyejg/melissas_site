class SiteController < ApplicationController
  
  def home
    @pieces = Piece.all
  end
  
  def gallery
    @pieces = Piece.all.page(params[:page])
  end
  
  def dashboard
    @piece = Piece.new
    @pieces = Piece.all
    @users = User.all
  end

end
