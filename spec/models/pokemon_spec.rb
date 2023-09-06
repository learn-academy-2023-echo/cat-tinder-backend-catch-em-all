require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  it "should validate name" do
    pokemon = Pokemon.create(
        specialty: 'Grass',
        level: 5,
        image: 'https://www.serebii.net/pokemon/art/001.png',
        strong_against: 'Water',
        weak_against: 'Fire',
        enjoys: 'likes to spit watermelon seeds'
    )
    expect(pokemon.errors[:name]).to_not be_empty
  end

  it "should validate specialty" do
    pokemon = Pokemon.create(
        name: 'Bulbasaur',
        level: 5,
        image: 'https://www.serebii.net/pokemon/art/001.png',
        strong_against: 'Water',
        weak_against: 'Fire',
        enjoys: 'likes to spit watermelon seeds'
    )
    expect(pokemon.errors[:specialty]).to_not be_empty
  end

  it "should validate level" do
    pokemon = Pokemon.create(
        name: 'Bulbasaur',
        image: 'https://www.serebii.net/pokemon/art/001.png',
        strong_against: 'Water',
        weak_against: 'Fire',
        enjoys: 'likes to spit watermelon seeds'
    )
    expect(pokemon.errors[:level]).to_not be_empty
  end
  
  it "should validate image" do
    pokemon = Pokemon.create(
        name: 'Bulbasaur',
        level: 5,
        strong_against: 'Water',
        weak_against: 'Fire',
        enjoys: 'likes to spit watermelon seeds'
    )
    expect(pokemon.errors[:image]).to_not be_empty
  end

  it "should validate strong_against" do
    pokemon = Pokemon.create(
        name: 'Bulbasaur',
        level: 5,
        image: 'https://www.serebii.net/pokemon/art/001.png',
        weak_against: 'Fire',
        enjoys: 'likes to spit watermelon seeds'
    )
    expect(pokemon.errors[:strong_against]).to_not be_empty
  end

  it "should validate weak_against" do
    pokemon = Pokemon.create(
        name: 'Bulbasaur',
        level: 5,
        image: 'https://www.serebii.net/pokemon/art/001.png',
        strong_against: 'Water',
        enjoys: 'likes to spit watermelon seeds'
    )
    expect(pokemon.errors[:weak_against]).to_not be_empty
  end

  it "should validate enjoys" do
    pokemon = Pokemon.create(
        name: 'Bulbasaur',
        level: 5,
        image: 'https://www.serebii.net/pokemon/art/001.png',
        strong_against: 'Water',
        weak_against: 'Fire'
    )
    expect(pokemon.errors[:enjoys]).to_not be_empty
  end

  it "should validate enjoys to be at least 10 characters" do 
    pokemon = Pokemon.create(
      name: 'Bulbasaur',
      specialty: 'Grass',
      level: 5,
      image: 'https://www.serebii.net/pokemon/art/001.png',
      strong_against: 'Water',
      weak_against: 'Fire',
      enjoys: 'nothing'
    )
      expect(pokemon.errors[:enjoys]).to include("is too short (minimum is 10 characters)")
  end

  it "should validate name to be at least 3 characters" do 
    pokemon = Pokemon.create(
      name: 'Tw',
      specialty: 'Grass',
      level: 5,
      image: 'https://www.serebii.net/pokemon/art/001.png',
      strong_against: 'Water',
      weak_against: 'Fire',
      enjoys: 'likes to spit watermelon seeds'
    )
      expect(pokemon.errors[:name]).to include("is too short (minimum is 3 characters)")
    end

    it "should not have a duplicate name" do
        pokemon = Pokemon.create(
            name: 'Bulbasaur',
            specialty: 'Grass',
            level: 5,
            image: 'https://www.serebii.net/pokemon/art/001.png',
            strong_against: 'Water',
            weak_against: 'Fire',
            enjoys: 'likes to spit watermelon seeds'
        )
        pokemon_2 = Pokemon.create(
            name: 'Bulbasaur',
            specialty: 'Fire',
            level: 7,
            image: 'https://www.serebii.net/pokemon/art/001.png',
            strong_against: 'Grass',
            weak_against: 'Water',
            enjoys: 'likes to spit watermelon seeds'
        )
        expect(pokemon_2.errors[:name]).to_not be_empty
    end
    
  end
