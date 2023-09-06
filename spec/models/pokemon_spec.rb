require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  it "should validate name" do
    pokemon = Pokemon.create(
        specialty: 'Grass',
        level: 5,
        image: 'https://www.serebii.net/pokemon/art/001.png',
        strong_against: 'Water',
        weak_against: 'Fire'
    )
    expect(pokemon.errors[:name]).to_not be_empty
  end

  it "should validate specialty" do
    pokemon = Pokemon.create(
        name: 'Bulbasaur',
        level: 5,
        image: 'https://www.serebii.net/pokemon/art/001.png',
        strong_against: 'Water',
        weak_against: 'Fire'
    )
    expect(pokemon.errors[:specialty]).to_not be_empty
  end

  it "should validate instance" do
    pokemon = Pokemon.create
    expect(pokemon.errors[:specialty]).to_not be_empty
    expect(pokemon.errors[:name]).to_not be_empty
    expect(pokemon.errors[:level]).to_not be_empty
    expect(pokemon.errors[:image]).to_not be_empty
    expect(pokemon.errors[:weak_against]).to_not be_empty
    expect(pokemon.errors[:strong_against]).to_not be_empty
  end

  it "should validates name to be atleast 3 characters" do 
    pokemon = Pokemon.create(
        name: 'Tw',
        specialty: 'Grass',
        level: 5,
        image: 'https://www.serebii.net/pokemon/art/001.png',
        strong_against: 'Water',
        weak_against: 'Fire'
    )
    expect(pokemon.errors[:name]).to be_empty
  end

end
