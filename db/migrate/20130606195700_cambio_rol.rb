class CambioRol < ActiveRecord::Migration
  def change
      change_column :users, :rol, :string, :default => "regular"
  end

end
