class SiteController < ApplicationController
  
  def home
    @pieces = Piece.all
  end
  
  def gallery
    @q = Piece.ransack(params[:q])
    @pieces = @q.result.page(params[:page])
  end
  
  def dashboard
    @piece = Piece.new
    @pieces = Piece.all
    @users = User.all
  end

end
