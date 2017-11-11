json.safe_check do
  json.array!(@safe_check) do |safe|
    json.safe safe_check.safe
  end
end