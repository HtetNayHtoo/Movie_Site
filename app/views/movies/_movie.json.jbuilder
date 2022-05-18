json.extract! movie, :id, :title, :price, :category, :poster_img, :created_at, :updated_at
json.url movie_url(movie, format: :json)
json.poster_img do
  json.array!(movie.poster_img) do |poster_img|
    json.id poster_img.id
    json.url url_for(poster_img)
  end
end
