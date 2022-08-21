class Message < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  
  belongs_to :chat
  validates :body, :chat_id, presence: true

  def generate_number
    application_id = self.chat.application_id
    chat_number = self.chat.number
    message_number = REDIS.incr("apps:#{application_id}:chats:#{chat_number}:messages_counter")
    self.number = message_number 
  end

  def as_json(options={})
    {
      :body => body,
      :number => number,
      :created_at => created_at,
      :updated_at => updated_at
    }
  end

  def as_indexed_json(options={})
    hash = self.as_json()
    hash['chat_id'] = self.chat_id
    hash
  end

  def self.search_in_chat(chat, q)
    Message.search query: {
      bool: {
        must: {
          wildcard: {
            body: "*#{q}*"
          }
        },
        filter: {
          term: {
            chat_id: "#{chat.id}"
          }
        }
      }
    }
  end
end
