class AddHungryToZombie < ActiveRecord::Migration
  def change
    add_column :zombies, :hungry, :boolean, :default => true
  end
end
