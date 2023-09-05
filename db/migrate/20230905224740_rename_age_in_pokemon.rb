class RenameAgeInPokemon < ActiveRecord::Migration[7.0]
  def change
    rename_column :pokemons, :age, :level
  end
end
