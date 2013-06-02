class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :body
      t.references :user
      t.references :question
      t.boolean :best

      t.timestamps
    end
    add_index :answers, :user_id
    add_index :answers, :question_id
  end
end
