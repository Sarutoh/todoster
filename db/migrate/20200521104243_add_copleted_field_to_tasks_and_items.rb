class AddCopletedFieldToTasksAndItems < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :completed, :boolean, default: false, null: false
    add_column :items, :completed, :boolean, default: false, null: false
  end
end
