module Events
  class StripeHandler
    def self.process(event)
      stripe_event = Stripe::Event.construct_from(event.data)

      case stripe_event.type
      when 'checkout.session.completed'
        checkout_session = stripe_event.data.object
        # now can do #{ checkout_session.customer }.. or some attribute of checkout_session object
        Piece.transaction do
          piece = Piece.find_by(id: checkout_session.client_reference_id)
          raise Exception.new("item already purchased!") if piece.quantity == 0
          piece.quantity = 0
          piece.save!
        end

        #need to add reciept mailer to customer and notification mailer to melissa
        
      end
    end
  end
end