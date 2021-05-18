class UpdatePaymentStatusWorker
    include Sidekiq::Worker
    sidekiq_options retry: false
  
    def perform(id, status)
      Payment.find(id).update_attribute(:status, status)
    end
end