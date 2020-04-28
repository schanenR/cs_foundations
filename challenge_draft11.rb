# this program was written by schanen ryan - ada developers academy application april 2020
# the program is an expense tracker for the ada state fair 
# created for the state of ada
# here it functions dressed up as a point of sale

# initialize 3 empty hash's - 1 for each party
party_1 = Hash.new
party_2 = Hash.new
party_3 = Hash.new

# length 3 array holding empty hash's 'party_1' 'party_2' & 'party_3'
parties = [party_1, party_2, party_3] 

# value pairs defining items and pricing stored in hash 'prices' 
prices = {}
prices[:tix] = {one_tix: 35.00, four_tix: 112.00}
prices[:concessions] = {cotton_candy: 1.25, curly_fries: {}}
prices[:concessions][:curly_fries] = {small_fry: 2.50, large_fry: 4.00}

# initialize variables used in parties loop
ticket_total = 0.00
concession_total = 0.00
fair_day_total = 0.00 
highest_dollar = 0
party_output = ""

# initialize new empty array for strings of highest spenders
highest_spenders = Array.new

# define method party_tallys holding hash structure for individual parties
# method party_tallys contians placeholders for party purchases - tickes & concessions
def party_tallys
    {:ticket_tally=>{:single_ticket=>0, :bundle_tickets=>0},
    :food_tally=>{:candy_tally=>0, :fry_tally=>{:sm_fry_tally=>0,
    :lg_fry_tally=>0}}}
end

# loop 'parties' array load party_tallys value pairs into each party
parties.length.times do |party|
    parties[party] = party_tallys
end

# require bundler for retrieval of gem 'tty-box'  
# TTY::Box provides box drawing component for TTY toolkit
require 'bundler/inline'

# sourced from https://rubygems.org/gems/tty-box/versions/0.5.0
# functionality learned from https://github.com/piotrmurach/tty-box
# source gem tty-box for program output architecture
gemfile do
  source 'https://rubygems.org'
  gem 'tty-box', '~> 0.5.0'
end

# formatted tty-box frames greeting 
puts
print TTY::Box.frame(width: 80, align: :center, padding: 1) {
"Welcome to the ADA STATE FAIR point of sale!"
}
puts 

# user or 'employee' prompted to enter name 
print " Please enter your employee name to clock in: "
# collect 'employee name' and capitalize whole string
employee_name = gets.chomp.upcase

# ruby 'Time' class to get time
# -25200 seconds or -7hrs to calculate local PST from coordinated universal time UTC
t = Time.new - 25200

# strftime method used to format time string output 
# %I - 12 hour clock hour
# %M - minutes
# %p - uppercase am / pm
# formatted time string stored into variable clock_in
clock_in = t.strftime("%I:%M%p")

puts "\n\n Employee #{employee_name}'s clock in time is: #{clock_in}\n\n"

# context for 'employee' - 3 parties - $35 tickets - $112 bundled tickes
print TTY::Box.frame(width: 80, align: :center) {
"EMPLOYEE UPDATES\n" + "Current ticket prices are $35.00." +
" Please tell the guests that \n" + "bundles of four are $112.00 for a limited time only!\n" + 
" Today we are accommodating three parties. Here comes the first group now!"
}
 
# loop over parties array to collect and calculate party totals
parties.length.times do |i|
    print "\n How many tickets would party ##{i+1} like to purchase?  "
    # collect value and make type integer
    party_tickets = gets.chomp.to_i
    puts
    
    if party_tickets == 0
        until party_tickets > 0
            print TTY::Box.frame(width: 80, align: :center) {
            "They don't want any tickets? You have to buy tickets to enter the fair!"
            }
            puts
            print " How many tickets would party ##{i+1} like to purchase? "
            party_tickets = gets.chomp.to_i
        end
    end
    
    # calulate number of tickets not purchased in bundle using modulo
    parties[i][:ticket_tally][:single_ticket] = party_tickets % 4
    
    # calculate number of bundles - 4 ticket 
    # ruby 'floor' method rounds down to nearest whole integer
    parties[i][:ticket_tally][:bundle_tickets] = party_tickets / 4.floor
    
    # print affirmation if bundled tickes purchased by party 
    if parties[i][:ticket_tally][:bundle_tickets] > 0
        puts
        print TTY::Box.frame( align: :center, padding: 1) {"They bought bundled tickets!"}
    end
    
    # menu output 
    puts
    print TTY::Box.frame( align: :center, padding: 2) {
    "MENU\n" + " \n" + "Cotton Candy - $1.25      \n" +
    " Curly Fries - $2.50 SMALL\n" + "             - $4.00 LARGE"
    }
    
    # prompt user for yes or no and save string value in uppercase
    print "\n\n Is party ##{i + 1} ordering food? Type \"YES\" or \"NO\" "
    food_answer = gets.chomp.upcase
    
    # if 'food_answer' is 'YES' order is taken
    # order tallys stored into individual party hash
    # solution to integer value needed from user found on stack overflow 
    # input_string.to_i.to_s == input_string
    # https://tinyurl.com/integer-check-schanen - source of solution
    if food_answer == "YES"
        print "\n\n                  # of COTTON CANDY orders: "
        candy_tally = nil
        
        loop do 
            candy_tally = gets.chomp
            break if candy_tally.to_i.to_s == candy_tally
            puts "\n NUMBER ENTRY PLEASE >>\n\n"
            print "                  # of COTTON CANDY orders: " 
        end
        
        parties[i][:food_tally][:candy_tally] = candy_tally.to_i
        candy_tally = candy_tally.to_i
        
        # if candy order is more than 0 - fry option given
        if candy_tally > 0
            print "\n\n Would they like fries with that? Type \"YES\" or \"NO\" "
            fry_answer = gets.chomp.upcase
        end
        
        # if fry_answer is 'YES' OR no candy was ordered
        # fry order input stored into individual party hash
        if (fry_answer == "YES") || (candy_tally == 0)
            print "\n\n                     # of SMALL FRY orders: " 
            sm_fry_tally = nil
            
            loop do 
                sm_fry_tally = gets.chomp
                break if sm_fry_tally.to_i.to_s == sm_fry_tally
                puts "\n NUMBER ENTRY PLEASE >>\n\n"
                print "                     # of SMALL FRY orders: " 
            end
            
            print "\n\n                     # of LARGE FRY orders: "
            lg_fry_tally = nil
            
            loop do 
                lg_fry_tally = gets.chomp
                break if lg_fry_tally.to_i.to_s == lg_fry_tally
                puts "\n NUMBER ENTRY PLEASE >>\n\n"
                print "                     # of LARGE FRY orders: " 
            end
            
            parties[i][:food_tally][:fry_tally][:lg_fry_tally] = lg_fry_tally.to_i
            parties[i][:food_tally][:fry_tally][:sm_fry_tally] = sm_fry_tally.to_i
        end
    end 
    
    # total party purchases and save values to variables
    # calculate single and bundle ticket totals 
    # add single and bundle totals for total ticket charge
    single_ticket_charge = parties[i][:ticket_tally][:single_ticket] * prices[:tix][:one_tix]
    
    bundle_ticket_charge = parties[i][:ticket_tally][:bundle_tickets] * prices[:tix][:four_tix]
    
    ticket_charges = single_ticket_charge + bundle_ticket_charge
    
    # calculate totals for party concession purchases
    # total concession purchases
    candy_charge = parties[i][:food_tally][:candy_tally] * prices[:concessions][:cotton_candy]
    
    sm_fry_charge = parties[i][:food_tally][:fry_tally][:sm_fry_tally] * prices[:concessions][:curly_fries][:small_fry]
    
    lg_fry_charge = parties[i][:food_tally][:fry_tally][:lg_fry_tally] * prices[:concessions][:curly_fries][:large_fry]
    
    concessions_charges = candy_charge + sm_fry_charge + lg_fry_charge
    
    # add party ticket and concession purchases for party total
    party_total = ticket_charges + concessions_charges
    
    # create new value pair in party hash storing party total 
    parties[i][:total] = party_total
    
    # concatenate and interpolate string with string formatting method sprintf
    # sprintf field type character 'f' converts float number to decimal
    # '.2' defines number of digits after decimal
    # sprintf converts decimal to string
    transaction_string = sprintf "*******************\n Party ##{i + 1}'s grand total: $%.2f \n
    Have a beautiful time at ADA STATE FAIR!\n" + "*******************", "#{party_total}" 
    puts
    
    # print transaction_sting in tty-box
    print TTY::Box.frame(width: 80, align: :center, padding: 1) {transaction_string}
    
    # the value of the highest party total gets stored in variable highest_dollar
    if party_total > highest_dollar
        highest_dollar = party_total
    end
    
    # the value of the party total gets stored in value pair with new key ':total'
    parties[i][:total] = party_total
    
    # the value of party ticket charge is added to value in variable 'ticket_total'
    # the value of party concessions total is added to value in variable 'concession_total'
    # the value of the party total is added to the value in variable 'fair_day_total' 
    ticket_total += ticket_charges
    concession_total += concessions_charges
    fair_day_total += party_total
    
    # concatenate and interpolate string with string formatting method sprintf
    # create string with party totals
    # add string to string 'party_output'
    party_output += sprintf "Party ##{i + 1} tickets - $%.2f\n     concessions - $%.2f\n
        -----------------\n
         total - $%.2f\n", "#{ticket_charges}", "#{concessions_charges}", "#{party_total}"
    
    # add newline to 'party_output' string
    party_output += " \n"
end
puts

# print statement in tty-box telling employee that ada state fair is at capacity
print TTY::Box.frame(width: 80, align: :center, padding: 2) {
"\n\n The ADA STATE FAIR has reached capacity!\n" + 
"Should we clock out and print end of day paperwork?"
}

print "\n Type \"YES\" or \"NO\" "
answer = gets.chomp.upcase

# move program forward if answer is 'YES' or not
# if answer is 'YES' one respoonse if not, another
# string value stored in variable 'send_off'
if answer == "YES"
    send_off = "Have a great night #{employee_name}!" 
else
    send_off =  "Sorry, it's time to go #{employee_name}!  <3 <3 <3\n
You've done enough around here for one day. Go kick up your feet!"
end
puts

# print 'send_off' in tty-box
print TTY::Box.frame(width: 80, align: :center, padding: 1) {send_off}

# create new clock to create value for clock out time
t_two = Time.new - 25200
clock_out = t_two.strftime("%I:%M%p")


# loop over party totals 
# if party total is equal highest dollar spent creates party string
# add new string as new element in 'highest_spenders' array
parties.length.times do |i|                       
    if parties[i][:total] == highest_dollar
    highest_spenders << " Party ##{i + 1}"
    end
end

baller_string = "HIGH SPENDERS\n"

# loop over 'highest_spenders' array 
# if index of element is 0, the value is added to string 'baller_string'
# if index is more than 0, ' &' plus the value are added to 'baller_string'
highest_spenders.length.times do |i|
    if i == 0
        baller_string << highest_spenders[i]
    else
        baller_string <<  " &" + highest_spenders[i]   
    end
end

# interpolate and concatenate and format string
# the value of string gets stored to variable 'print_out'
print_out = sprintf "ADA STATE FAIR\n" + " \n" + "***\n" + 
"EMPLOYEE NAME: #{employee_name}\n" + "EMPLOYEE CLOCK IN: #{clock_in}" + 
"  OUT: #{clock_out}\n" + "***\n" + " \n" + "#{party_output}" + " \n" +
"***\n" + "#{baller_string}\n" + "***\n" + " \n" + 
"  Ticket total - $%.2f\n" + "Concession total - $%.2f\n" +
"----------------------------\n" + 
"Fair Day Total - $%.2f\n", "#{ticket_total}", "#{concession_total}", "#{fair_day_total}"

# prints 'print_outs' string variable in tty-box
puts
print TTY::Box.frame(height: 38, align: :center, padding: 2) {print_out}
puts
