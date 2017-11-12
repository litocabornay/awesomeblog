json.safe do
  json.array!(@safe) do |safe|
    json.number safe.number
  end
end