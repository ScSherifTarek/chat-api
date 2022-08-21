class Chat < ApplicationRecord
  belongs_to :application
  has_many :messages , dependent: :destroy
  validates :name, :application_id, presence: true
  before_create :generate_number

  def generate_number
    chatNumber = REDIS.incr("apps:#{self.application_id}:chats_counter")
    self[:number] = chatNumber 
  end

  def as_json(options={})
    {
      :name => name,
      :number => number,
      :messages_count => messages_count,
      :created_at => created_at,
      :updated_at => updated_at
    }
  end
end
