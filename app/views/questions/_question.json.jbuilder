json.question_id question.id
json.user do
  json.user_id question.user.id
  json.email question.user.email
  json.display_name question.user.display_name
  json.user_meows question.user.net_meows
  json.profile_url "http://ourapp.com/users/#{question.user.id}"
end
json.title question.title
json.description question.description
json.created_at question.created_at
json.question_meows question.meow_questions.count
json.answers question.answers.by_meows do |a|
  a.id == question.accepted_answer_id ? accepted = true : accepted = false
  json.answer_id a.id
  json.accepted accepted
  json.answer_text a.answer_text
  json.answered_at a.created_at
  json.answer_meows a.net_meows
  json.user do
    json.user_id a.user.id
    json.email a.user.email
    json.display_name a.user.display_name
    json.user_meows a.user.net_meows
    json.profile_url "https://ourapp.com/users/#{a.user.id}"
  end
end
