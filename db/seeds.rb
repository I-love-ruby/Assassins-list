require "faker"

 10.times do
 user = User.create(
    name: Faker::Name.first_name,
    password: Faker::Internet.password
    )
end


10.times do
  Post.create(
    name: Faker::Internet.user_name,
    location: Faker::Address.city,
    crime: Faker::Lorem.word,
    bounty: Faker::Commerce.price,
    pic_url: Faker::Avatar.image,
    tagline: Faker::Company.catch_phrase,
    user_id: User.all.sample.id
    )
end