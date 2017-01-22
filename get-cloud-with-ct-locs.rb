filtered_list = []
locations = Location.where(no_call_tracking: true)

locations.each do |loc|
  client = Client.where(id: loc.client_id).first
  if client.present? && client.status != "Core-Active" && client.status != "Deleted" && client.g5_internal != true && loc.status != "Deleted"
    filtered_list << loc.urn
  end
end

filtered_list.each do |location|
  puts "#{location}"
end
