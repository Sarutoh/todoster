# frozen_string_literal: true

class Task < ApplicationRecord
  before_save do
    if completed_changed? && completed
      items.update_all(completed: true)
    elsif completed_changed? && !completed
      items.update_all(completed: false)
    end
  end

  belongs_to :user

  has_many :items, dependent: :destroy

  validates :title, presence: true, length: { in: 6..20 }, allow_blank: false
end
