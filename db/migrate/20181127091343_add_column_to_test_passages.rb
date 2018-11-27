class AddColumnToTestPassages < ActiveRecord::Migration[5.2]
  def change
    add_column :test_passages, :completed, :boolean, default: false
  end
end
