json.extract! user, :id, :name, :type, :email, :password_digest, :phone, :address, :dob, :profile_img, :created_at, :updated_at
json.url user_url(user, format: :json)
json.profile_img do
  json.array!(user.profile_img) do |profile_img|
    json.id profile_img.id
    json.url url_for(profile_img)
  end
end
