class CreateQuestionLabels < ActiveRecord::Migration
  def change
    create_table :question_labels do |t|
      t.references :label
      t.references :question

      t.timestamps
    end
    add_index :question_labels, :label_id
    add_index :question_labels, :question_id
  end
end
