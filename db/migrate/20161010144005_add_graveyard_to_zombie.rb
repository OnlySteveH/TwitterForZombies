class AddGraveyardToZombie < ActiveRecord::Migration
  def change
    add_column :zombies, :graveyard, :string
  end
end
