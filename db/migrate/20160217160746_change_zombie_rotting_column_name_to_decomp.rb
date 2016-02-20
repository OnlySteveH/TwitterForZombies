class ChangeZombieRottingColumnNameToDecomp < ActiveRecord::Migration
  def change
  	rename_column :zombies, :rotting, :decomp
  end
end
