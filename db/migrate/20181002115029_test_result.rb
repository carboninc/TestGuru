class TestResult < ActiveRecord::Migration[5.2]
  def change
    create_table :test_results, id: false do |t|
      t.integer :user_id
      t.integer :test_id
    end

    add_index :test_results, :user_id
    add_index :test_results, :test_id
  end
end
