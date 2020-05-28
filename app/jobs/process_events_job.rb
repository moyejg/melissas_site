class ProcessEventsJob < ApplicationJob
  queue_as :default

  def perform(event_id)
    event = WebhookEvent.find(event_id)
    if event.pending? || event.failed?
      event.update(state: :processing)    
      begin
        case event.source
        when 'stripe'
          Events::StripeHandler.process(event)
          # can add other when cases i.e 'github'
        end
        event.update(state: :processed)
      rescue => e
        event.update(state: :failed, processing_errors: e)
      end 
    end
  end
end
