class UpdateCountersJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Application.find_each do |application|
      chatsQuery = Chat.where(application_id: application.id)
      chatsCount = chatsQuery.count
      application.chats_count = chatsCount
      application.save()
      chatsQuery.find_each do |chat|
        chat.messages_count = Message.where(chat_id: chat.id).count
        chat.save()
      end
    end
  end
end
