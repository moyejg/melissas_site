class PiecesController < ApplicationController
  before_action :set_piece, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /pieces
  # GET /pieces.json
  def index
    @pieces = Piece.all
  end

  # GET /pieces/1
  # GET /pieces/1.json
  def show
  end

  def showcase
    @piece = Piece.find_by(showcase: true)
  end

  # GET /pieces/new
  def new
    @piece = Piece.new
  end

  # GET /pieces/1/edit
  def edit
  end

  # POST /pieces
  # POST /pieces.json
  def create
    @piece = Piece.new(piece_params)
    @users = User.all

    respond_to do |format|
      if @piece.save
        PieceMailer.with(piece: @piece).piece_notification_email.deliver_now
        format.html { redirect_to @piece, notice: 'Piece was successfully created.' }
        format.json { render :show, status: :created, location: @piece }
      else
        format.html { render :new }
        format.json { render json: @piece.errors, status: :unprocessable_entity }
      end
    end
  end 

  # PATCH/PUT /pieces/1
  # PATCH/PUT /pieces/1.json
  def update
    respond_to do |format|
      if @piece.update(piece_params)
        format.html { redirect_to @piece, notice: 'Piece was successfully updated.' }
        format.json { render :show, status: :ok, location: @piece }
      else
        format.html { render :edit }
        format.json { render json: @piece.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pieces/1
  # DELETE /pieces/1.json
  def destroy
    @piece.destroy
    respond_to do |format|
      format.html { redirect_to pieces_url, notice: 'Piece was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def delete_image_attachment
    @image = ActiveStorage::Blob.find_signed(params[:id])
    @image.attachments.first.purge
    redirect_back(fallback_location: pieces_path)
  end

  def piece_modal
    @piece = Piece.find(params[:piece_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_piece
      @piece = Piece.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def piece_params
      params.require(:piece).permit(:name, :description, :showcase_description, :quantity, :price, :piece_type, :size, :frame, :video, :showcase, :showcase_image, images: [])
    end
end
