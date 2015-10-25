json.question_id question.id
json.user do
  json.user_id question.user.id
  json.email question.user.email
  json.display_name question.user.display_name
  json.user_meows question.user.total_meows
  json.profile_url "http://ourapp.com/users/#{question.user.id}"
end
json.title question.title
json.description question.description
json.created_at question.created_at
json.question_meows question.meow_questions.count
json.answers question.answers do |a|
  a.id == question.accepted_answer_id ? accepted = true : accepted = false
  json.answer_id a.id
  json.accepted accepted
  json.answer_text a.answer_text
  json.answered_at a.created_at
  json.answer_meows a.meow_answers.count
  json.user a.user
end