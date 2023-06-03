# Add seed data in this file
require 'rest-client'
require 'json'

puts "Seeding spells..."

# Define the spells you want to add to the database
spells = ["acid-arrow", "animal-messenger", "calm-emotions", "charm-person"]

# Iterate over each spell
spells.each do |spell|
  # Make a request to the API endpoint for the individual spell
  response = RestClient.get "https://www.dnd5eapi.co/api/spells/#{spell}"

  # Parse the response into a Ruby hash
  spell_hash = JSON.parse(response)

  # Create a new spell record in the database
  Spell.create(
    name: spell_hash["name"],
    level: spell_hash["level"],
    description: spell_hash["desc"][0]
  )
end

puts "Done seeding!"