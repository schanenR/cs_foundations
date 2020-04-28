puts
puts "Welcome to Schanen's Candy Machine!\n"

puts "(All candy is provided virtually)\n"
puts
print "How much money do you have to spend? $"

budget = gets.to_f
puts 
puts

if budget >= 5.00
    puts "With $#{budget} you can have your choice of the menu!\n"
elsif budget >= 3.00
    puts "We definetly have some options under $#{budget}.\n"
elsif (budget < 3) && (budget > 0)
    puts "Let's see what we can do with $#{budget}.\n"
else (budget < 0)
    puts "Listen my friend, I don't owe you anything.\n"
end

puts 
puts "Here are the menu options as well as their letter options.\n"
puts

a = 1.50
b = 2.75
c = 3.00
d = 3.99
e = 4.50

puts "   A $1.50 Chiclet Gum \n
   B $2.75 Justin's Peanut Butter Cup \n
   C $3.00 Peanut M&M's \n   
   D $3.99 Violet Pastilles \n   
   E 4.50 Bar of Dark Chololate\n"
puts
print "So, what would you like? "
userChoice = gets.chomp.upcase
puts

if (userChoice == "A")
    candyPrice = a

elsif (userChoice == "B")
    candyPrice = b

elsif (userChoice == "C")
    candyPrice = c

elsif (userChioce == "D")
    candyPrice = d
elsif (userChoice == "E")
    candyPrice = e
else 
    puts "Sorry, the machine is jammed. Try again soon."
end

change = budget - candyPrice

if (candyPrice > budget)
    puts "I'm sorry, that is not enough money for your candy choice. \n 
    Here is your $#{budget} back. Please visit again soon!"
else
    puts "Thanks for shopping & please enjoy your treat!\n
    Your change is $#{change.round(2)}"
end
puts