class FixColumnName < ActiveRecord::Migration
  def change
	rename_column :questions, :body, :content
  end
end
