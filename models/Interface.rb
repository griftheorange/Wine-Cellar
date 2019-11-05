class Interface

    #First method called, gets username, passes to make_new_user_prompt if given a
    #username that doesnt exist. If exists, passes user object found to self.main_menu
    def self.login
        while true
            puts "Hi! Welcome to WineCellar.you! What is your username? (Press 'Q' to quit)"
            username = gets.chomp
            username.downcase == 'q' ? break : #Breaks out of menu if a person enters Q
            user = User.all.find{|user| user.username == username} #checks if user already exists based on username
            if !user #If it does not exist, prompts to make new user
                self.make_new_user_prompt(username)
            else
                main_menu(user)
            end
        end
    end

    #Takes a username given from login, and asks if the user wants to make a new
    #username, if yes, makes new user and passes to main menu, if not, returns to login,
    #if invalid input re-prompts for valid input
    def self.make_new_user_prompt(username)
        while true
            puts "I don't recognize that username. Would you like to make a new user? (Y/N)"
            input = gets.chomp
            case input.downcase
            when 'y'
                puts "What name would you like to have for your new username: #{username}"
                name = gets.chomp
                user = User.new(name ,username)
                puts "Thanks #{name}! You have just created a new account with the username #{username}."
                self.main_menu(user)
                break
            when 'n'
                break
            else 
                p 'That is not a valid input. '
            end
        end
    end

    #passed a user object, build main menu interaction from user object information
    #TODO, doesnt do anything yet
    def self.main_menu(user)
        puts "Welcome #{user.name}! How can we be of assistance today?"
    end
end