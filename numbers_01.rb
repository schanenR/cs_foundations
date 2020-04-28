# ask the user to enter a positive interger value 
puts "Please enter a positive integer."
# convert the user input to an integer and save value in variable
first_num = gets.chomp.to_i
# repeat the previous steps two more times for a total of three times
puts "Please enter a second positive ineger."
second_num = gets.chomp.to_i

puts "Please enter a third positive integer."
third_num = gets.chomp.to_i

# create variable to hold value to be added
addition = 20

# using compound assignments add variable 'addition' to user values
first_num += addition
second_num += addition
third_num += addition

# print string with adjusted values using interpolation
puts "Twenty added to the numbers you entered gives
 us #{first_num}, #{second_num} and #{third_num}."

 puts "Thank you for playing!"
