json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :department, :studentnumber, :phonenumber, :age, :sex
  json.url user_url(user, format: :json)
end
