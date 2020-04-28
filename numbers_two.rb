# explain program to user with puts for space
puts
puts "This program will ask you to enter numbers and will evaluate them
in relation to the number \"20\" ~~~ "
puts
# ask the user to enter a positive interger value 
puts "Please enter a positive integer: "
# convert the user input to an integer and save value in variable
first_num = gets.chomp.to_i 

# loop which evaluates user input in relation to 20, applied to the first input
if first_num == 20
    puts "Your entry 20 is equal to 20."
elsif first_num > 20
    puts "You have enterend a number greater than 20."
elsif first_num < 0
    puts "Your entry is invalid becasue it is a negative number."
else first_num < 20
    puts "Your number is less than 20."
end

# repeat the previous steps two more times for a total of three times
puts "Please enter a second positive integer: "
second_num = gets.chomp.to_i
# apply loop to second integer
if second_num == 20
    puts "Your entry 20 is equal to 20."
elsif second_num > 20
    puts "You have enterend a number greater than 20."
elsif second_num < 0
    puts "Your entry is invalid becasue it is a negative number."
else second_num < 20
    puts "Your number is less than 20."
end

puts "Please enter a third positive integer: "
third_num = gets.chomp.to_i

if third_num == 20
    puts "Your entry 20 is equal to 20."
elsif third_num > 20
    puts "You have enterend a number greater than 20."
elsif third_num < 0
    puts "Your entry is invalid becasue it is a negative number."
else third_num < 20
    puts "Your number is less than 20."
end

puts
puts "Thank you for using this tool. Please run the program again if
you would like to evaluate more numbers!"
puts
