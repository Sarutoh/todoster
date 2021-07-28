# frozen_string_literal: true

class Task < ApplicationRecord
  MIN_TITLE_LENGTH = 6
  MAX_TITLE_LENGTH = 200

  after_update do
    if completed_changed? && completed
      items.update_all(completed: true)
    elsif completed_changed? && !completed
      items.update_all(completed: false)
    end
  end

  belongs_to :user

  has_many :items, dependent: :destroy

  validates :title, presence: true, length: { in: MIN_TITLE_LENGTH..MAX_TITLE_LENGTH }, allow_blank: false
end
