# a program by schanen ryan which is a midlib called " Strolling for Flowers"

# introduce use to the title and function of the program sapcing for ligibility
puts 
puts
puts " Welcome to the MadLib \"Strolling for Flowers\" by, Schanen Ryan" 
puts
# give instructions for entering the words
puts "Please enter a word for each part of speech specified!"

# collect use inputs and assign to variables 
adj = "Adjective: "
col = "Color: "
noun = "Noun: "
foods = "Food (plural): "
edVerb = "Verb ending with \"ed\": "
ingVerb = "Verb ending with \"ing\": "
num = "Number: "
clothing = "Clothing item: "
adverb = "Adverb: "
name = "Your name: "

puts adj
flowerAdj = gets.chomp

puts col
flowerCol = gets.chomp
# capitalize user inputs for flower name
puts noun
flowerNameOne = gets.chomp.capitalize

puts noun
flowerNameTwo = gets.chomp.capitalize

puts adj
leaves = gets.chomp

puts foods
smell = gets.chomp

puts edVerb 
flowerEd = gets.chomp

puts ingVerb 
flowerIng = gets.chomp
# convert user input to integer
puts num
flowerNum = gets.chomp.to_f

puts clothing 
clothingItem = gets.chomp
# capitalize user input for punk friend name
puts noun
friend = gets.chomp.capitalize
# capitalize expletives
puts noun 
yellNoun = gets.chomp.upcase

puts adj
yellAdj = gets.chomp.upcase

puts noun
yellNounTwo = gets.chomp.upcase

puts adverb
endVerb = gets.chomp

puts name
userName = gets.chomp
# madlib title with empty lines above and below using puts
# title includes userName
puts 
puts "\"Strolling for flowers\" a collaboration between #{userName} and Schanen Ryan "
puts

# complie and concatenate story with variables holding user input
userStory = " While taking a stroll in the woods this morning I happend upon 
            a #{flowerAdj} #{flowerCol} flower. Upon closer inspection, I
            realized the flowers were the ellusive #{flowerNameOne} #{flowerNameTwo}. 
            It's leaves are #{leaves} and their flowers smell like #{smell}. 
            They #{flowerEd} in the sunlight and were #{flowerIng} gently, covered 
            in morning dew. I stuffed #{flowerNum} flowers into my #{clothingItem} and 
            headed down the path. On the trail I ran in to my good friend #{friend}.
            When I told them I had found #{flowerNameOne} #{flowerNameTwo} in the 
            woods they yelled excitedly, \"HOLY #{yellNoun} in a #{yellAdj} #{yellNounTwo}.\" 
            I left #{friend} after some Spring plant talk and headed home #{endVerb}."

# print out the userStory

puts userStory
            