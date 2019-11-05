#Cellar instances belong to a single user, but relate to many bottles
class Cellar
    attr_reader :user, :name
    @@all = []
    @@all_hash_user_key = {}

    #initialize with a user pointer, and a name, adds self to all and hash
    #for tracking
    def initialize(user, name)
        @user = user
        @name = name
        @@all << self
        self.add_to_user_key(user)
        Stash.all_hash_cellar_key[self] = []
    end

    #Adds a given bottle to this cellar by creating a 'Stash' object as a joiner
    def stash_bottle(bottle)
        Stash.new(self, bottle)
    end

    #gets all bottles in an instance of a cellar
    def bottles
        Stash.all_hash_cellar_key[self].map{|stash|
            stash.bottle
        }
    end

    #facilitates initializer
    def add_to_user_key(user)
        if Cellar.all_hash_user_key[user]
            Cellar.all_hash_user_key[user] << self
        else
            Cellar.all_hash_user_key[user] = [self]
        end
    end

    #gets array of all cellars made
    def self.all
        @@all
    end

    #gets hash of all cellars made with user keys
    def self.all_hash_user_key
        @@all_hash_user_key
    end
end