class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :user_badges do |t|
      t.string :name, null: false
      t.string :image, null: false
      t.integer :rule, null: false, default: 0

      t.timestamps
    end
  end
end
