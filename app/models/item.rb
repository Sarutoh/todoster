class Item < ApplicationRecord
  after_save do

    if task.items.count == task.items.completed.count
      task.update!(completed: true)
    end
  end

  belongs_to :task

  scope :completed, -> { where(completed: true) }
end
