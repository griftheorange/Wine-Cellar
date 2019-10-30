require "pry"

require_relative "models/Wine.rb"

def open
    print "Hi! welcome to your wine cellar. "
    while true
        puts "What would you like to do?"
        puts "\t1. Add a bottle"
        puts "\t2. See wines in your cellar"
        case (gets.chomp.to_s.downcase)
        when '1' , '1.'
            add_a_bottle
        when '2', '2.'
            see_wines_in_cellar
        when 'q'
            break
        else
            puts "That is not a valid option, please try again"
        end
    end
end

################################################################################
#below codes for the options a user recieves at differen menus

def add_a_bottle
    bottle = Wine.new
    bottle.brand = ask_for_brand
    bottle.quality = ask_for_quality
    bottle.color = ask_for_color
    bottle.sweet = ask_if_boolean("sweet")
    bottle.sour = ask_if_boolean("sour")
    bottle.bitter = ask_if_boolean("bitter")
    bottle.acidic = ask_if_boolean("acidic")

end

def see_wines_in_cellar
    puts "saw wine"
end

#################################################################################
#methods for adding a bottle to cellar from user input

def ask_for_brand
    puts "What is the brand name?"
    gets.chomp.to_s.downcase
end

def ask_for_quality
    while true
        puts "How much did you enjoy drinking it from 1-10?"
        score = gets.chomp
        if score.to_f.class == Float and score.to_f >= 1 and score.to_f <= 10
            return score.to_f
        else
            puts "That is not a valid input, please input a number from 1-10."
        end
    end
end

def ask_for_color
    while true
        puts "What color was this wine?"
        color = gets.chomp.to_s.downcase
        if color == "red" || color == "white" || color == "pink"
            return color
        else
            print "That is not a valid wine color (Red, White, Pink). "
        end
    end

end

def ask_if_boolean(trait)
    print "Was the wine #{trait}? "
    gets_boolean_input
end

###############################################################################
#code below filters type of input for some user queries

def gets_boolean_input
    while true
        puts "Please respond yes or no."
        input = gets.chomp
        if input.downcase == "yes"
            return true
        elsif input.downcase == "no"
            return false
        else
            print "That is not a valid input. "
        end
    end
end

def gets_string_input
end

open