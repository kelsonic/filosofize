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
  Filosofer.find(rand(1..9)).ponderings.create(title: "#{Faker::ChuckNorris.fact}",body: "Does a #{Faker::StarWars.specie} #{Faker::Hacker.verb} #{Faker::StarWars.character} on a #{Faker::StarWars.vehicle}?")
end

20.times do
  pondering_1 = Pondering.all.sample
  #pondering_1.theories.create(body: Faker::StarWars.quote, filosofer_id: rand(1..5), best_theory: false)
  theory = Theory.create(body: Faker::StarWars.quote, filosofer_id: rand(1..5), best_theory: false)
  pondering_1.theories << theory
end

20.times do
  pondering = Pondering.all.sample#
  comment = Comment.create(filosofer_id: rand(1..20), body: Faker::StarWars.quote)
  pondering.comments << comment
  theory = Theory.all.sample#
  comment = Comment.create(filosofer_id: rand(1..20), body: Faker::StarWars.quote)
  theory.comments << comment
end

# Add comments, upvotes, and downvotes
