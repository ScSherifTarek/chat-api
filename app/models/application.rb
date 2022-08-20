class Application < ApplicationRecord
    validates :name, :token, presence: true
    validates :token, uniqueness: true
    before_validation :generate_token

    def generate_token
        self[:token] = SecureRandom.uuid if token.blank?
    end
end
