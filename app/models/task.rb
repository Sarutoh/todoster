# frozen_string_literal: true

class Task < ApplicationRecord
  before_save do
    if completed_changed? && completed
      items.update_all(completed: true)
    elsif completed_changed? && !completed
      items.update_all(completed: false)
    end
  end

  has_many :items, dependent: :destroy
end
