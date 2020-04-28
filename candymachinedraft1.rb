# this is a candy machine program written by schanen ryan
#program introduction
puts
puts "Welcome to Schanen's Candy Machine!\n"
# disclaimer 
puts "(All candy is provided virtually.)\n"
# get user input for dollar ammount available
print "How much money do you have to spend?  $"
# convert string to float
budget = gets.to_f
puts
puts
# confirm and contextualize the ammount in relation to options
# negative number response
if budget >= 5.0 
    puts "With $#{budget} you can have your choice of the menu!\n"
elsif budget >= 3.0
    puts "We definetly have some options under $#{budget}.\n"
elsif (budget < 3.0) && (budget > 0) 
    puts "Lets see what we can do with $#{budget}.\n"
else 
    puts "Listen my friend, I don't owe you anything.
    Let alone #{budget}.\n"  
end  
# create variables to hold candy prices
puts
puts "Here are the menu options as well as their letter options.\n"
puts
a = 1.50
b = 2.75
c = 3.00
d = 3.99
e = 4.50
# print menu for the user
puts "   A $1.50 Chiclet Gum \n
   B $2.75 Justin's Peanut Butter Cup \n
   C $3.00 Peanut M&M's \n   
   D $3.99 Violet Pastilles \n   
   E 4.50 Bar of Dark Chololate\n"
puts  
# prompt selection from user
# upcase user input
print "So what will you have? "
userChoice = gets.chomp.upcase
puts
change = 0

if (userChoice == "A") 
    candyPrice = a
    change = budget - candyPrice
elsif (userChoice == "B")
    candyPrice = b
    change = budget - candyPrice
elsif (userChoice == "C")
    candyPrice = c
    change = budget - candyPrice
elsif (userChoice == "D")
    candyPrice = d
    change = budget - candyPrice
elsif (userChoice == "E")
    candyPrice = e
    change = budget - candyPrice 
else     
    puts "Sorry, you have made an incorrect selection. Start again."
end

if (change < 0)
    puts "I'm sorry, that is not enough money for your candy choice. \n Here is your $#{budget} back.
    Come back agian soon!"
elsif (change >= 0)
    puts "Thanks for shopping & enjoy your treat! Your change is $#{change}"
end

puts

 