class CreateChatJob < ApplicationJob
  queue_as :default

  def perform(attributes)
    Chat.create(attributes)
  end
end
