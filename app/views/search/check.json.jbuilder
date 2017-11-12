if params[:q]
json.safe do
  json.array!(@safe) do |safe|
    json.number safe.number
  end
end
end

if params[:qframe]
json.safe2 do
  json.array!(@safe2) do |safe2|
    json.number_of_frame safe2.number_of_frame
  end
end
end

if params[:qfoundation]
json.safe3 do
  json.array!(@safe3) do |safe3|
    json.number_of_foundation safe3.number_of_foundation
  end
end
end

if params[:qslot]
json.safe4 do
  json.array!(@safe4) do |safe4|
    json.number_slot safe4.number_slot
  end
end
end