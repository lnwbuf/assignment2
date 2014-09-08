# 5631249021 Thanachote Chotisorayuth
# 5631320921 Lalinda Chirachanakul

require "csv"

first_line = true

persons = []

# read data into the memory
CSV.foreach("./data.csv", col_sep: ",") do |row|
  
  if first_line == true 
    first_line = false
    next
  end
  
  full_name = row[0]
  score = row[1]
  color = row[2]  

  person = { full_name: full_name, score: score.to_i, color: color }
  persons << person 
end

#Find highest score
max_score = persons[0][:score]
persons.each do |person| 
  if person[:score] >= max_score
    max_score = person[:score]
  end 
end

#Print highest scores's person
puts "Person(s) with highest score(s) "
persons.each do |person|
  if person[:score] == max_score
    puts person[:full_name]
  end
end

min_score = max_score #Start descending with the max value in array

#Find lowest score
persons.each do |person|
  if person[:score] <= min_score 
    min_score = person[:score]
  end
end

puts "\n"

#Print lowest score's person
puts "Person(s) with the lowest score(s): "
persons.each do |person|
  if person[:score] == min_score
    puts person[:full_name]
  end
end      

#Find Average Score
sum = 0
persons.each do |person|
  sum = sum + person[:score]
end 
puts "\n"
puts "Mean: " + (sum/persons.length).to_s #persons.count ก็ได้
puts "\n"

# Compare Color Index and Color String 
# การเก็บข้อมูล ว่ามีสีอะไรบ้าง และจำนวนเท่าไหร่
# ลงไปใน array 
color_name  = []
color_count = []

persons.each do |person|
  this_persons_color = person[:color]
  
  if color_name.include? this_persons_color
    index = color_name.index(this_persons_color)
    color_count[index] = color_count[index] + 1
  else
    color_name << this_persons_color
    color_count << 1
  end
end

maximum_color_count = color_count.max

# โค้ดนี้จะปริ้นตัวมากสุดแค่ตัวเดียว
# index = color_count.index(สีที่มากที่สุด)
# puts "Most popular colour: " + color_name[index]

indices_of_max_color_count = []

index = 0 

color_count.each do |count|
  if count == maximum_color_count
    indices_of_max_color_count << index
  end
  index = index + 1 
end

puts "Most popular color(s):"
indices_of_max_color_count.each do |i|
  puts color_name[i]
end


# สมมติ [1,4,7,87,2,2,-1]
minimum_color_count = color_count.min
# คืน -1

# โค้ดนี้จะปริ้นตัวต่ำสุดแค่ตัวเดียว
# index = color_count.index(สีที่น้อยที่สุด)
# puts color_name[index]

indices_of_min_color_count = [] 
index = 0 

color_count.each do |count|
  if count == minimum_color_count
    indices_of_min_color_count << index
  end
  index = index + 1 
end
puts "\n"

puts "Least popular color(s):"
indices_of_min_color_count.each do |i|
  puts color_name[i]
end

puts "\n"

puts "Formatted names: "
persons.each do |person|

  # "kim tae hee"
  full_name = person[:full_name].split(" ")
  # ["kim","tae","hee"]

  surname = full_name[0]
  # "kim"

  surname[0] = surname[0].downcase 
  surname[-1] = surname[-1].upcase 

  # เอาตั้งแต่ตัวที่สอง มาต่อกัน จนถึงตัวสุดท้าย โดยคั่นด้วย " "
  first_name = full_name[1..-1].join(" ")
  # "tae hee"

  first_name[-1] = first_name[-1].upcase
  first_name[0] = first_name[0].downcase

  puts surname + " " + first_name
end






