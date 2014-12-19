# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

100.times do |n|
  Question.create(title: "This is question #{n+1}. There are a lot of questions in the database now.",
                  description: "The best part of waking up is Folger's in your cup. Lucky Charms: they're
                  magically delicious. Follow your nose. By mennen. Anything less would be uncivilized.
                  Dumpling King makes really good dumplings.",
                  user_id: 2)
end
