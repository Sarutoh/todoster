class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
  	rename_column :items, :user_id, :task_id
  end
end
