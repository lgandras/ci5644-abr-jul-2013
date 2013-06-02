class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.references :question
      t.references :answer
      t.references :user

      t.timestamps
    end
    add_index :comments, :question_id
    add_index :comments, :answer_id
    add_index :comments, :user_id
  end
end
