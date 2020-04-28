# this part of the program identifies novel elements and loads them into a new array

repeat_test = [1, 3, 4, 8, 2, 3, 4, 9, 23, 7, 7, 3]
puts "This is the array which includes repeated numbers."
puts repeat_test

puts "\nThis is an new empty array."
transfer_array = Array.new
puts transfer_array
puts

repeat_test.length.times do |i|
  
  counter = 0
  
  transfer_array.length.times do |outputs|
    
    if repeat_test[i] == transfer_array[outputs]
      counter += 1
    end

    break if counter > 0

  end
  
  if counter == 0
    transfer_array << repeat_test[i]
  end

end

puts "\nThis is the new array with transfered numbers, not including repeats." 
puts transfer_array
puts

# this part of the program identifies repeated values and loads them into a new array
repeat_test = [1, 3, 4, 8, 2, 3, 4, 9, 23, 7, 7, 3]
puts "This is the array which includes repeated numbers."

puts repeat_test
puts "\nThis is a new empty array."

transfer_array = Array.new
puts transfer_array

puts
repeat_test.length.times do |i|
  counter = 0

  repeat_test.length.times do |outputs|

    if repeat_test[i] == repeat_test[outputs]
      counter += 1
    end

  end

  if counter > 1
    transfer_array << repeat_test[i]
  end

end

puts "\nThis is the new array with only the repeated values." 
puts transfer_array
puts

