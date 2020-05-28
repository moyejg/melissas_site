class PieceMailer < ApplicationMailer
  default from: 'vidamagicgallery@gmail.com'

  def piece_notification_email
    @users = User.all
    @piece = params[:piece]
    @users.each do |user| 
      mail(to: user.email, subject: "Melissa's got a new piece!")
    end 
  end 
end 
