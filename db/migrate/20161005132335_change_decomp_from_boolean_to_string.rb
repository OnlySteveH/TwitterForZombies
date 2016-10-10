class ChangeDecompFromBooleanToString < ActiveRecord::Migration
  def change
  	change_column :zombies, :decomp, :string
  end
end
