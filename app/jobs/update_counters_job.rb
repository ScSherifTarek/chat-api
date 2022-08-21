class UpdateCountersJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Application.find_each do |application|
      chats_query = Chat.where(application_id: application.id)
      application.chats_count = chats_query.count
      application.save()
      chats_query.find_each do |chat|
        chat.messages_count = Message.where(chat_id: chat.id).count
        chat.save()
      end
    end
  end
end
