class AddDefaultValueToHungry < ActiveRecord::Migration
  def change
  	change_column :zombies, :hungry, :boolean, :default => true
  end
end
