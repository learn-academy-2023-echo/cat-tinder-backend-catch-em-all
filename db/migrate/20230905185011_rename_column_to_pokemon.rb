class RenameColumnToPokemon < ActiveRecord::Migration[7.0]
  def change
    rename_column :pokemons, :type, :specialty
  end
end
