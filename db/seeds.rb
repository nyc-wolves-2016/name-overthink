20.times do
  user = User.create!( username: Faker::Internet.user_name,
               email: Faker::Internet.email,
               password: "password")
end

20.times do
  question = Question.create!( question: Faker::Hipster.sentence,
               user_id: rand(1..20))
end

20.times do
  answer = Answer.create!( answer: Faker::ChuckNorris.fact,
               question_id: rand(1..20),
               user_id: rand(1..20))
end


u= User.new(first_name: "boe", last_name: "jenkins", username: "yaBoi", email: "jaBoi@gmail.com", password: "password")

bob= User.new(first_name: "bob", last_name: "billy", username: "billybob", email: "bob@gmail.com", password: "password")

q= Question.create(title: "Fake question", content: "testing 123", user_id: 1)


a= Answer.create(content: "This is my answer", user_id: 2, question_id: 1)

c = a.comments.create(content:"I see what you mean", user_id: 1)

q.comments.create(content:"Dude are you f-ing serious? Youre so dumb, but I'll answerr", user_id: 2)
a.votes.create(value: 1, user_id: 1)

q.votes.create(value: 1, user_id: 2)
c.votes.create(value: 1, user_id: 2)
