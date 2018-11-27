class AddColumnTimerToTests < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :timer, :integer, default: nil
  end
end
