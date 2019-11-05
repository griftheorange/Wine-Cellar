class User
    attr_reader :name, :username
    @@all = []

    #initializes with name and username, name always stored downcase
    def initialize(name, username)
        @name = name.downcase
        @username = username
        @@all << self
    end

    #returns cellars for this user instance
    def cellars
        Cellar.all_hash_user_key[self]
    end

    #returns reviews associated with this user
    def reviews
        Review.all_hash_user_key[self]
    end

    #from user, give it a cellar and a bottle, and will pass to cellar.stash_bottle method
    def add_bottle_to_cellar(cellar, bottle)
        cellar.stash_bottle(bottle)
    end

    #returns all bottles from all cellars this user owns
    def all_bottles_in_all_cellars
        cellars.map{|cellar|
            cellar.bottles
    }.flatten
    end

    #Given a name, can find a cellar as long as it belongs to this user instance
    def find_cellar_by_name(name)
        cellars.find{|cellar|
            cellar.name == name
        }
    end

    #creates a review to associate a wine and user
    def review_wine(bottle)
        Review.new(self, bottle)
    end

    #Creates a new cellar with a given name, and associates it to this user
    def open_new_cellar(name)
        Cellar.new(self, name)
    end

    #returns all Users
    def self.all
        @@all
    end

    
end