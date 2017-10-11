# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
[
  'Cat',
  'Dog',
  'Horse',
  'Barnyard',
  'Pig',
  'Rabbit',
  'Small & Furry',
  'Scales, Fins & Other',
  'Wildlife'
].each do |animal_type|
  AnimalType.find_or_create_by!(name: animal_type)
end

[
  'Sonoma',
  'Santa Rosa',
  'Petaluma',
  'Healdsburg',
  'Sebastopol',
  'Rohnert Park',
  'Windsor',
  'Cotati',
  'Guerneville',
  'Cloverdale',
  'Kenwood',
  'Geyserville',
  'Bodega',
  'Jenner',
  'The Sea Ranch',
  'Cazadero',
  'Valley Ford',
  'Duncans Mills',
  'Rio Nido',
  'Annapolis, California',
  'Salmon Creek',
  'Fulton, California',
  'Bloomfield'
].each do |location|
  Location.find_or_create_by!(name: location)
end
