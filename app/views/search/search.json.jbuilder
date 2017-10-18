json.machine do
  json.array!(@machine) do |machine|
    json.name machine.name
  end
end