class Review
    attr_reader :user, :bottle, :taste_preferences
    @@all = []
    @@all_hash_user_key = {}
    @@all_hash_bottle_key = {}

    #initialized with a user pointer and bottle pointer, links two through itself
    #Stores self in all array, and points user key to self and bottle key to self
    #in hashes
    def initialize(user, bottle)
        @user = user
        @bottle = bottle
        @taste_preferences = {} #sour, sweet, bitter, acidic, fruit
        self.add_to_user_key(user)
        self.add_to_bottle_key(bottle)
        @@all << self
    end

    #Facilitates initializing the user key hash
    def add_to_user_key(user)
        if Review.all_hash_user_key[user]
            Review.all_hash_user_key[user] << self
        else
            Review.all_hash_user_key[user] = [self]
        end
    end

    #Facilitates initializing the bottle key hash
    def add_to_bottle_key(bottle)
        if Review.all_hash_bottle_key[bottle]
            Review.all_hash_bottle_key[bottle] << self
        else
            Review.all_hash_bottle_key[bottle] = [self]
        end
    end

    #Returns all Review objects
    def self.all
        @@all
    end

    #returns user-key hash
    def self.all_hash_user_key
        @@all_hash_user_key
    end

    #return bottle-key hash
    def self.all_hash_bottle_key
        @@all_hash_bottle_key
    end

end