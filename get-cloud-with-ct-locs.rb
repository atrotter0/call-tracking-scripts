locations = Location.where(no_call_tracking: true)
filtered_list = []

locations.each do |loc|
  if loc.status == "Deleted" || loc.status == "Core-Active"
    next
  else
    filtered_list << loc
  end
end

filtered_list.each do |location|
  puts "#{location.urn}"
end