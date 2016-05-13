20.times do
  Filosofer.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Internet.user_name,
    password: "password",
    email: Faker::Internet.email
  )
end

20.times do
  Filosofer.find(rand(1..9)).ponderings.create(body: "Does a #{Faker::StarWars.specie} #{Faker::Hacker.verb} #{Faker::StarWars.character} on a #{Faker::StarWars.vehicle}?")
end

20.times do
  pondering_1 = Filosofer.find(rand(1..9)).ponderings.shuffle.pop
  pondering_1.theories.create(body: Faker::StarWars.quote) unless pondering_1 == nil
end

20.times do
  Pondering.all.shuffle.pop.comments.create(filosofer_id: rand(20), body: Faker::StarWars.quote)
  Theory.all.shuffle.pop.comments.create(filosofer_id: rand(20), body: Faker::StarWars.quote)
end

# Add comments, upvotes, and downvotes
