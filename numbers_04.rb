# this is a program written by schanen ryan
# this program takes in user values and evaluates them in various ways
# introduce the program to the user
puts
puts "Welcome to my fourth Number Game! This game will evaluate a set of numbers for you."
puts
# prompt the user for the total # of values to be evaluated and convert to integer
print "      How many numbers would you like me to evaluate?"
totalNums = gets.chomp.to_i
puts
# create array of user defined length
my_array = Array.new(totalNums)
# loop to recieve values from user and store said values in empty array
# within loop an if statement to appropriately append 1 with "st" , 2 with "nd" etc.  some issues i.e. 212
my_array.length.times do |i|
    if i + 1 == (11 || 12 || 13)
        iString = "#{i + 1}th"
    elsif i + 1 % 10 == 1
        iString = "#{i + 1}st"
    elsif i + 1 % 10 == 2 
        iString = "#{i + 1}nd"
    elsif i + 1 % 10 == 3
        iString = "#{i + 1}rd"
    else 
        iString = "#{i + 1}th"
    end
    print "Enter the #{iString} positive integer: "
    element = gets.chomp.to_i
    my_array[i] = element
end
puts
puts "Comparing the last value entered, #{my_array.last}, here are the observations:"
puts
# variable to hold value of last index in array
lastVal = my_array.last
# loop for observations on the last index value compared to each previous index
totalNums.times do |i| 
    indexVal = my_array[i]
    if indexVal == lastVal
        puts "The value at index #{i}, #{indexVal} is equal to the value of the last index, #{lastVal}."
    elsif indexVal > lastVal
        puts "The value at index #{i}, #{indexVal} is greater than the value at the last index, #{lastVal}."
    else 
        puts "The value at index #{i}, #{indexVal} is less than the value at the last index, #{lastVal}."
    end
    i += 1
end       
# initialize min and max variables with 'index 0' value and sum of array with '0'
minVal = my_array[0]
maxVal = my_array[0]
arraySum = 0
# calculate minimum value in array
# calulate maximum value in array
# use loop to gather the sum of the array values
totalNums.times do |i|
    indexVal = my_array[i]
    if indexVal < minVal
        minVal = indexVal;
    end
    if indexVal > maxVal
        maxVal = indexVal
    end
    arraySum += indexVal
end
# calculate average or mean in this case of the array values
arrayAve = arraySum.to_f / totalNums
puts
puts "The minimum value in the array is #{minVal}."
puts "The maximum value in the array is #{maxVal}."
puts "The average of all the values in the array is #{arrayAve}."
puts 
puts "      Thank you for playing my number evaluation game!        "
puts

