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
  Filosofer.find(rand(1..9)).ponderings.find(rand(1..15)).theories.create(body: Faker::StarWars.quote)
end


# Add comments, upvotes, and downvotes
