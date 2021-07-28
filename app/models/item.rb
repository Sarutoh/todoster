# frozen_string_literal: true

class Item < ApplicationRecord
  after_update do
    task.update!(completed: true) if task.items.count == task.items.completed.count
  end

  validates :item, presence: true, allow_blank: false

  belongs_to :task

  scope :completed, -> { where(completed: true) }
end
