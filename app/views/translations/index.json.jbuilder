json.array!(@translations) do |translation|
  json.extract! translation, :id, :papa, :pontifice, :active
  json.url translation_url(translation, format: :json)
end
