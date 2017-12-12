# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
["Не повоторять", "Каждый день", "Каждую неделю", "Каждый месяц", "Каждый год"].each do |f|
  TaskFrequency.create(frequency: f)
end