class Message < ApplicationRecord
  belongs_to :chat
  validates :body, :chat_id, presence: true

  def generate_number
    applicationId = self.chat.application_id
    chatNumber = self.chat.number
    messageNumber = REDIS.incr("apps:#{applicationId}:chats:#{chatNumber}:messages_counter")
    self[:number] = messageNumber 
  end

  def as_json(options={})
    {
      :body => body,
      :number => number,
      :created_at => created_at,
      :updated_at => updated_at
    }
  end
end
