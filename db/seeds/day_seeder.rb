require_relative "../../app/models/day"
require_relative "../../app/services/day_service"

@day_array = %w[Friday Saturday Sunday Monday Tuesday Wednesday Thursday]
@i = 1

puts "Data insertion finished for days table!!!"
@day_array.each do |d|
  puts "Inserting data into days table and day is:" + " " + d
  Day.create!(id: @i, day: d)
  @i += 1
end
puts "Data insertion finished for days table!!!"




