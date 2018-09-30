class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :title
      t.boolean :correct
      t.references :question_id, foreign_key: true

      t.timestamps
    end
  end
end
