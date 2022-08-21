class CreateChatJob < ApplicationJob
  queue_as :default

  def perform(attributes)
    Chat.where(attributes).first_or_create
  end
end
