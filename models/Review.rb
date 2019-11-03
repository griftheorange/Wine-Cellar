class Review
    attr_reader :user, :bottle, :taste_preferences
    @@all = []
    @@all_hash_user_key = {}
    @@all_hash_bottle_key = {}

    def initialize(user, bottle)
        @user = user
        @bottle = bottle
        @taste_preferences = {} #sour, sweet, bitter, acidic, fruit
        self.add_to_user_key(user)
        self.add_to_bottle_key(bottle)
        @@all << self
    end

    def add_to_user_key(user)
        if Review.all_hash_user_key[user]
            Review.all_hash_user_key[user] << self
        else
            Review.all_hash_user_key[user] = [self]
        end
    end

    def add_to_bottle_key(bottle)
        if Review.all_hash_bottle_key[bottle]
            Review.all_hash_bottle_key[bottle] << self
        else
            Review.all_hash_bottle_key[bottle] = [self]
        end
    end

    def self.all
        @@all
    end

    def self.all_hash_user_key
        @@all_hash_user_key
    end

    def self.all_hash_bottle_key
        @@all_hash_bottle_key
    end

end