json.array! @questions do |q|
  json.question_id q.id
  json.user do
    json.user_id q.user.id
    json.email q.user.email
    json.display_name q.user.display_name
    json.user_meows q.user.total_meows
    json.profile_url "http://test.com/users/#{q.user.id}"
  end
  json.title q.title
  json.description q.description
  json.created_at q.created_at
  json.updated_at q.updated_at
  json.question_meows q.meow_questions.count
  json.answers_count q.answers.count
end
