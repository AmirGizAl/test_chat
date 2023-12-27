class Message < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :chat

  scope :sorted, -> { order(:id) }

  validates :content, presence: true
end
