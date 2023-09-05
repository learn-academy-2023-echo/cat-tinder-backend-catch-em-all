require 'rails_helper'

RSpec.describe "Pokemons", type: :request do
  describe "GET /index" do
    it "lists all pokemons" do
      Pokemon.create( {
        name: 'Bulbasaur',
        specialty: 'Grass',
        level: 5,
        image: 'https://www.serebii.net/pokemon/art/001.png',
        strong_against: 'Water',
        weak_against: 'Fire'
    })

    get '/pokemons' 

    pokemon = JSON.parse(response.body)
    expect(response).to have_http_status(200)
    expect(pokemon.length).to eq 1
    end

  end

  describe "POST /create" do
    it "creates a pokemon" do
      pokemon_params = { 
        pokemon: {
          name: 'Bulbasaur',
          specialty: 'Grass',
          level: 5,
          image: 'https://www.serebii.net/pokemon/art/001.png',
          strong_against: 'Water',
          weak_against: 'Fire'
        }
      }

      post '/pokemons', params: pokemon_params

      expect(response).to have_http_status(200)

      pokemon = Pokemon.first

      expect(pokemon.name).to eq 'Bulbasaur'
      expect(pokemon.specialty).to eq 'Grass'
      expect(pokemon.level).to eq 5
      expect(pokemon.image).to eq 'https://www.serebii.net/pokemon/art/001.png'
      expect(pokemon.strong_against).to eq 'Water'
      expect(pokemon.weak_against).to eq 'Fire'
      
    end
  end

  describe "PATCH /update" do
    it "updates a pokemon" do
      pokemon_params = { 
        pokemon: {
          name: 'Bulbasaur',
          specialty: 'Grass',
          level: 5,
          image: 'https://www.serebii.net/pokemon/art/001.png',
          strong_against: 'Water',
          weak_against: 'Fire'
        }
      }

      post '/pokemons', params: pokemon_params

      pokemon = Pokemon.first

      update_pokemon_params = {
        pokemon: {
          name: 'Bulbasaur',
          specialty: 'Grass',
          level: 7,
          image: 'https://www.serebii.net/pokemon/art/001.png',
          strong_against: 'Water',
          weak_against: 'Fire'
        }
      }

      patch "/pokemons/#{pokemon.id}", params: update_pokemon_params

      updated_pokemon = Pokemon.find(pokemon.id)
      expect(response).to have_http_status(200)

      expect(updated_pokemon.level).to eq 7
    end
  end

  describe 'DELETE /destroy' do
    it 'deletes a pokemon' do 
      pokemon_params = { 
        pokemon: {
          name: 'Bulbasaur',
          specialty: 'Grass',
          level: 5,
          image: 'https://www.serebii.net/pokemon/art/001.png',
          strong_against: 'Water',
          weak_against: 'Fire'
        }
      }

      post '/pokemons', params: pokemon_params

      pokemon = Pokemon.first

      delete "/pokemons/#{pokemon.id}"

      expect(response).to have_http_status(200)

      pokemons = Pokemon.all

      expect(pokemons).to be_empty
    end
  end
end
