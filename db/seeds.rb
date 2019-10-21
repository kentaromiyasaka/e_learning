require 'faker'

User.create!(name: 'ken', email: 'kentamiya7426@gmail.com', password: 'aaaaaa', is_admin: true)

20.times do |n|
  Category.create(
    title: Faker::Commerce.unique.department,
    description: Faker::Lorem.sentence(3)
  )
end

20.times do |n|
  User.create!(name: Faker::Name.unique.name,
        email: "user#{n}@gmail.com",
        password: "password")
end

categories = Category.order("id DESC").take(5)

categories.each do |category|
  5.times do
    content = Faker::Lorem.unique.word
    word = category.words.build(content: content)

    nth = rand(0..2)

    3.times do |i|
      if i == nth
        word.choices.build(content: content, is_correct: true)
      else
        word.choices.build(content: Faker::Lorem.word)
      end
    end

    word.save!
  end
end