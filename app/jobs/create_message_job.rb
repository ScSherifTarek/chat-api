class CreateMessageJob < ApplicationJob
  queue_as :default

  def perform(attributes)
    Message.create(attributes)
  end
end
