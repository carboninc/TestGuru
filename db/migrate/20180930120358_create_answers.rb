class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :answer
      t.references :user_id, foreign_key: true
      t.references :question_id, foreign_key: true

      t.timestamps
    end
  end
end
