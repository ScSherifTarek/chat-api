class CreateMessageJob < ApplicationJob
  queue_as :default

  def perform(attributes)
    Message.where(attributes).first_or_create
  end
end
