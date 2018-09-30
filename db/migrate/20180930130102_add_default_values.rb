class AddDefaultValues < ActiveRecord::Migration[5.2]
  def change
    change_column_default :tests, :level, from: 0, to: 1
    change_column_default :answers, :correct, from: true, to: false
  end
end
