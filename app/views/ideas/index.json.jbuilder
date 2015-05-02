json.array!(@ideas) do |idea|
  json.extract! idea, :id, :name, :summary, :idea_type, :color, :image, :link, :github
  json.url idea_url(idea, format: :json)
end
