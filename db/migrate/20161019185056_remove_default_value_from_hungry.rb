class RemoveDefaultValueFromHungry < ActiveRecord::Migration
  def change
  	change_column_default :zombies, :hungry, nil
  end
end
