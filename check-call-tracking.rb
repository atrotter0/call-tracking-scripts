# Steps:
# 1. Run get-cloud-with-ct-locs.rb script in g5-Hub
# 2. Copy output into filtered-cloud-list.txt
# 3. Run check-call-tracking.rb from terminal

def copy_core_file_to_array(file, array)
  puts "Copying #{file}..."
  File.open(file).each do |line|
    # removes formatting from Core list
    line.slice!(0)
    line.chop!.chop!
    line.strip!
    array << line
  end
  puts "#{file} copied!"
  #puts "#{array}"
end

def copy_file_to_array(file, array)
  puts "Copying #{file}..."
  File.open(file).each do |line|
    line.strip!
    array << line
  end
  puts "#{file} copied!"
  #puts "#{array}"
end

def compare_arrays(array_1, array_2, array_3)
  puts "Comparing lists..."
  array_1.each do |item|
    if array_2.include?(item)
      array_3 << item
    end
  end
  puts "Finished comparing lists!"
end

def display_final_list(array)
  puts "Locations with no_call_tracking true in Hub with a call tracking plan in Core:"
  array.each do |pos|
    puts "#{pos}"
  end
  puts "#{array.count} locations"
end

def print_array_to_file(filename, array)
  puts "Writing to #{filename}..."
  File.open(filename, 'w') { |file| 
    array.each do |line| 
    file.write("#{line}\n")
  end
  file.write("#{array.count} locations")
  }
  puts "Done!"
end

# script start
core_file = "stores-with-ct-cloud-urns.txt"
cloud_file = "filtered-cloud-list.txt"
final_file = "final-list.txt"
core_list = []
cloud_list = []
final_list = []
copy_core_file_to_array core_file, core_list
copy_file_to_array cloud_file, cloud_list
compare_arrays core_list, cloud_list, final_list
display_final_list final_list
print_array_to_file final_file, final_list
