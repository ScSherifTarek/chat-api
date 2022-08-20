class Application < ApplicationRecord
    has_many :chats , dependent: :destroy
    validates :name, presence: true
    before_create :generate_token

    def generate_token
        self[:token] = SecureRandom.uuid
    end

    def as_json(options={})
        {
          :name => name,
          :token => token,
          :created_at => created_at,
          :updated_at => updated_at
        }
    end
end
