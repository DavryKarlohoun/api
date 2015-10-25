json.array! @questions do |q|
  json.question_id q.id
  json.user do
    if q.user
      json.user_id q.user_id
      json.email q.user.email
      json.display_name q.user.display_name
      json.user_meows q.user.net_meows
      json.profile_url "http://test.com/users/#{q.user.id}"
    else
      json.user_id "Deleted user"
      json.email "Deleted user"
      json.display_name "Deleted user"
      json.user_meows "Deleted user"
      json.profile_url nil
    end
  end
  json.title q.title
  json.description q.description
  json.created_at q.created_at
  json.updated_at q.updated_at
  json.question_meows q.net_meows
  json.answers_count q.answers.count
end
