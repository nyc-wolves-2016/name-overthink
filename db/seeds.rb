8.times do
  user = User.create!(
    username: Faker::Internet.user_name,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "password")
end

User.all.each do |user|
  3.times do
  user.questions.create(
    content: Faker::Lorem.sentence,
    title: Faker::Name.title
    )
  end
end

Question.all.each do |question|
  user_array = (1..User.all.count).to_a

  rand(2..3).times do

    question.answers.create(
      content: Faker::Lorem.sentence,
      user_id: rand(1..8)
    )

    question.comments.create(
      content: Faker::Lorem.sentence,
      user_id: rand(1..8)
    )

    question.votes.create(
      value: [1,-1].sample,
      user_id: user_array.delete(user_array.sample)
    )

  end
end

Answer.all.each do |answer|
  user_array = (1..User.all.count).to_a

  rand(2..3).times do

    answer.comments.create(
      content: Faker::Lorem.sentence,
      user_id: rand(1..8)
    )

    answer.votes.create(
      value: [1,-1].sample,
      user_id: user_array.delete(user_array.sample)
    )

  end
end

Comment.all.each do |comment|
  user_array = (1..User.all.count).to_a

  rand(1..3).times do

  comment.votes.create(
      value: [1,-1].sample,
      user_id: user_array.delete(user_array.sample)
    )
  end

end





