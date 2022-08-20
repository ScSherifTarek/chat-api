class Chat < ApplicationRecord
  belongs_to :application
  validates :name, :application_id, presence: true
  before_create :generate_number

  def generate_number
    self[:number] = Chat.where(:application_id => self.application_id).count + 1
  end

  def as_json(options={})
    {
      :name => name,
      :number => number,
      :created_at => created_at,
      :updated_at => updated_at
    }
  end
end
