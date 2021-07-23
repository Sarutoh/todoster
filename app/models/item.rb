# frozen_string_literal: true

class Item < ApplicationRecord
  after_save do
    task.update!(completed: true) if task.items.count == task.items.completed.count
  end

  belongs_to :task

  scope :completed, -> { where(completed: true) }
end
