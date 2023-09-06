# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

pokemons = [
    {
        name: 'Bulbasaur',
        specialty: 'Grass',
        level: 5,
        image: 'https://www.serebii.net/pokemon/art/001.png',
        strong_against: 'Water',
        weak_against: 'Fire',
        enjoys: 'likes to spit watermelon seeds'
    },
    {
        name: 'Charmander',
        specialty: 'Fire',
        level: 4,
        image: 'https://www.serebii.net/pokemon/art/004.png',
        strong_against: 'Grass',
        weak_against: 'Water',
        enjoys: 'play with fire'
    },
    {
        name: 'Squirtle',
        specialty: 'Water',
        level: 7,
        image: 'https://www.serebii.net/pokemon/art/007.png',
        strong_against: 'Fire',
        weak_against: 'Grass',
        enjoys: 'loves to swim'
    }
]

pokemons.each do |each_pokemon|
    Pokemon.create each_pokemon
    puts "creating pokemon #{each_pokemon}"
end