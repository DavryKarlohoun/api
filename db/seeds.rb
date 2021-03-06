# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Question.destroy_all
Answer.destroy_all
MeowQuestion.destroy_all
MeowAnswer.destroy_all

User.create!(full_name: "ryan", email: "r@example.com", password: "password", token: SecureRandom.hex, display_name: "rgraham")
User.create!(full_name: "david", email: "d@example.com", password: "password", token: SecureRandom.hex, display_name: "dbern")
User.create!(full_name: "terry", email: "t@example.com", password: "password", token: SecureRandom.hex, display_name: "tkalhoun")
User.create!(full_name: "karlo", email: "k@example.com", password: "password", token: SecureRandom.hex, display_name: "keleuterio")

50.times do
  User.create!(
    full_name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    token: SecureRandom.hex,
    display_name: Faker::Internet.user_name)
end

users = User.all
200.times do
  Question.create!(
    user_id: users.sample.id,
    title: Faker::Lorem.sentence,
    description: Faker::Lorem.paragraph,
    #accepted_answer_id:
  )
end

questions = Question.all
500.times do
  Answer.create!(
    user_id: users.sample.id,
    question_id: questions.sample.id,
    answer_text: Faker::Lorem.paragraph)
end

accepted_answers = (1..200).to_a.shuffle.take(50)
question_ids = Question.all.pluck(:id)
question_ids.each do |q|
  break if accepted_answers.length == 0
  answer = accepted_answers.sample
  Question.find(q).update(accepted_answer_id: answer)
  Answer.find(answer).update(question_id: q)
  accepted_answers.delete(answer)
end

answers = Answer.all
1000.times do
  MeowAnswer.create!(user_id: users.sample.id,
    answer_id: answers.sample.id,
    up: [true, false].sample)
end


1000.times do
  MeowQuestion.create!(user_id: users.sample.id,
  question_id: questions.sample.id,
  up: [true, false].sample)
end
