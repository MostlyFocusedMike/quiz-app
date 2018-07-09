class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :question
      t.string :correct_answer
      t.string :wrong1
      t.string :wrong2
      t.string :wrong3
      t.string :topic_id

      t.timestamps
    end
  end
end
