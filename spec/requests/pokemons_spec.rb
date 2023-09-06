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
        weak_against: 'Fire',
        enjoys: 'likes to spit watermelon seeds'
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
          weak_against: 'Fire',
          enjoys: 'likes to spit watermelon seeds'
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
      expect(pokemon.enjoys).to eq 'likes to spit watermelon seeds'
      
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
          weak_against: 'Fire',
          enjoys: 'likes to spit watermelon seeds'
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
          weak_against: 'Fire',
          enjoys: 'likes to spit watermelon seeds'
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
          weak_against: 'Fire',
          enjoys: 'likes to spit watermelon seeds'
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

  describe "Cannot create new pokemon without valid attributes" do
    it "doesn't create a pokemon without a name" do
      pokemon_params = { 
        pokemon: {
          specialty: 'Grass',
          level: 5,
          image: 'https://www.serebii.net/pokemon/art/001.png',
          strong_against: 'Water',
          weak_against: 'Fire',
          enjoys: 'likes to spit watermelon seeds'
        }
      }

      post '/pokemons', params: pokemon_params
      expect(response.status).to eq(422)
      pokemon = JSON.parse(response.body)
      expect(pokemon['name']).to include "can't be blank"
    end

    it "doesn't create a pokemon without a specialty" do
      pokemon_params = { 
        pokemon: {
          name: 'Bulbasaur',
          level: 5,
          image: 'https://www.serebii.net/pokemon/art/001.png',
          strong_against: 'Water',
          weak_against: 'Fire',
          enjoys: 'likes to spit watermelon seeds'
        }
      }

      post '/pokemons', params: pokemon_params
      expect(response.status).to eq(422)
      pokemon = JSON.parse(response.body)
      expect(pokemon['specialty']).to include "can't be blank"
    end

    it "doesn't create a pokemon without a level" do
      pokemon_params = { 
        pokemon: {
          name: 'Bulbasaur',
          specialty: 'Grass',
          image: 'https://www.serebii.net/pokemon/art/001.png',
          strong_against: 'Water',
          weak_against: 'Fire',
          enjoys: 'likes to spit watermelon seeds'
        }
      }

      post '/pokemons', params: pokemon_params
      expect(response.status).to eq(422)
      pokemon = JSON.parse(response.body)
      expect(pokemon['level']).to include "can't be blank"
    end

    it "doesn't create a pokemon without an image" do
      pokemon_params = { 
        pokemon: {
          name: 'Bulbasaur',
          specialty: 'Grass',
          level: 5,
          strong_against: 'Water',
          weak_against: 'Fire',
          enjoys: 'likes to spit watermelon seeds'
        }
      }

      post '/pokemons', params: pokemon_params
      expect(response.status).to eq(422)
      pokemon = JSON.parse(response.body)
      expect(pokemon['image']).to include "can't be blank"
    end

    it "doesn't create a pokemon without a strong_against" do
      pokemon_params = { 
        pokemon: {
          name: 'Bulbasaur',
          specialty: 'Grass',
          level: 5,
          image: 'https://www.serebii.net/pokemon/art/001.png',
          weak_against: 'Fire',
          enjoys: 'likes to spit watermelon seeds'
        }
      }

      post '/pokemons', params: pokemon_params
      expect(response.status).to eq(422)
      pokemon = JSON.parse(response.body)
      expect(pokemon['strong_against']).to include "can't be blank"
    end

    it "doesn't create a pokemon without a weak_against" do
      pokemon_params = { 
        pokemon: {
          name: 'Bulbasaur',
          specialty: 'Grass',
          level: 5,
          image: 'https://www.serebii.net/pokemon/art/001.png',
          strong_against: 'Water',
          enjoys: 'likes to spit watermelon seeds'
        }
      }

      post '/pokemons', params: pokemon_params
      expect(response.status).to eq(422)
      pokemon = JSON.parse(response.body)
      expect(pokemon['weak_against']).to include "can't be blank"
    end

    it "doesn't create a pokemon without enjoys" do
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
      expect(response.status).to eq(422)
      pokemon = JSON.parse(response.body)
      expect(pokemon['enjoys']).to include "can't be blank"
    end
  end

end
