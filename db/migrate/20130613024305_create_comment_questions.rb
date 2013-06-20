class CreateCommentQuestions < ActiveRecord::Migration
  def change
    create_table :comment_questions do |t|
      t.text :body
      t.references :question
      t.references :user

      t.timestamps
    end
    add_index :comment_questions, :question_id
    add_index :comment_questions, :user_id
  end
end
