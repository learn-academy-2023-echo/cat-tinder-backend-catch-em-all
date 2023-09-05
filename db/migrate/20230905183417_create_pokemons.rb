class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :type
      t.integer :age
      t.text :image
      t.string :strong_against
      t.string :weak_against

      t.timestamps
    end
  end
end
