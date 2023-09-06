class AddColumnToPokemon < ActiveRecord::Migration[7.0]
  def change
    add_column :pokemons, :enjoys, :string
  end
end
