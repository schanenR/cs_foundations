# this program is a numbers problem by schanen ryan
# collect loop interation number from user
puts
puts "Welcome to my game. This game takes in a user supplied number 
and determines if it is dividible by 3!"
puts
print "Hello! Please tell me how many numbers you would like to enter: "
userPlays = gets.chomp.to_i
puts


i = 1
# this loop is imperfect -- there are exceptions to the rule i.e. 212
  
until i > userPlays
    if i == (11 || 12 || 13)
        iString = "#{i}th"
    elsif i % 10 == 1
        iString = "#{i}st"
    elsif i % 10 == 2 
        iString = "#{i}nd"
    elsif i % 10 == 3
        iString = "#{i}rd"
    else 
        iString = "#{i}th"
    end
    print "Please enter the #{iString} positive integer: "
    gameNum = gets.chomp.to_i
    puts
    if gameNum % 3 == 0
        puts "#{gameNum} is divisible by 3."
        puts
        i += 1
    else
        puts "#{gameNum} is not divisible by 3."
        puts
        i += 1
    end
end
puts
puts "Thank you for playing my divisible by 3 game!"
puts
puts "              See you again soon <3"
puts
