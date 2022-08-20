class Application < ApplicationRecord
    validates :name, presence: true
    before_create :generate_token

    def generate_token
        self[:token] = SecureRandom.uuid
    end
end
