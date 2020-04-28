# this program was written by schanen ryan
# this program evaluates a random set of 5 numbers between 12..21
# this program also evaluates a set of same number supplied 
# by the user within the same range, 12..21
puts
puts "      Hello! Welcome to my fifth Numbers Game!"
puts
puts "Please provide five integer values between 12 and 21, both inclusive: "
puts
user_array = Array.new
random_array = Array.new

5.times do |i|
    print "What's number #{i + 1}? "
    userNum = gets.chomp.to_i 
    user_array << userNum
    randNum = rand(12..21)
    random_array << randNum
end

hashOne = Hash.new
hashOne[:random_numbers] = random_array
hashOne[:user_input] = user_array

puts
puts "I can give you more information about any number \n
between 12 and 21, both inclusive."
puts



3.times do 
    matchRand = 0
    matchUser = 0
    print "Give me a number: "
    evalNum = gets.chomp.to_i
    hashOne.each do |key, value|
        if (key == :random_numbers) 
            value.each do |i|
                if evalNum == i
                    matchRand += 1
                end
            end
        end
        if (key == :user_input)
            value.each do |i|
                if evalNum == i
                    matchUser += 1
                end
            end
        end
    end
    if matchRand == 0
        puts "  The number, #{evalNum} did not show up in the randomly generated numbers."
    elsif matchRand == 1
        puts "  The number, #{evalNum} shows up 1 time in the randomly generated numbers."
    else
        puts "  The number, #{evalNum} shows up #{matchRand} times in the randomly generated numbers."
    end
    if matchUser == 0
        puts "  The number, #{evalNum} was not provided by the user earlier."
    elsif matchUser == 1
        puts "  The number, #{evalNum} was provided one time by the user earlier."
    else
        puts "  The number, #{evalNum} was provided #{matchUser} times by the user."
    end
end
puts 
puts
puts hashOne
puts
# loop with if statements checking for chosen number in two arrays
