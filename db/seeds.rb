20.times do
  user = User.create!(
    username: Faker::Internet.user_name,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "password")
end

20.times do
  question = Question.create!(
    content: Faker::Lorem.sentence,
    title: Faker::Name.title,
    user_id: rand(1..20))
end

20.times do
  answer = Answer.create!(
    content: Faker::Lorem.sentence,
    question_id: rand(1..20),
    user_id: rand(1..20))
end

# 20.times do
#   comment = Comment.create!(
#     content: Faker::Hipster.sentence,
#     question_id: rand(1..20),
#     commentable_id: rand(1..20),
#     commentable_type: ["Answer", "Question"].sample,
#     user_id: rand(1..20))
# end


u= User.create(first_name: "boe", last_name: "jenkins", username: "yaBoi", email: "jaBoi@gmail.com", password: "password")

bob= User.create(first_name: "bob", last_name: "billy", username: "billybob", email: "bob@gmail.com", password: "password")

q= Question.create(title: "Fake question", content: "testing 123", user_id: 1)


a= Answer.create(content: "This is my answer", user_id: 2, question_id: 1)

c = a.comments.create(content:"I see what you mean", user_id: 1)

q.comments.create(content:"Dude are you f-ing serious? Youre so dumb, but I'll answerr", user_id: 2)
a.votes.create(value: 1, user_id: 1)

q.votes.create(value: 1, user_id: 2)
c.votes.create(value: 1, user_id: 2)
