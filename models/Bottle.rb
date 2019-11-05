#Casts for Bottle objects, a bottle with same name, color and brand
#should exist only ONCE in memory
class Bottle
    attr_reader :brand, :color, :name
    @@all = []

    #Initializes with brand, color, name, all to downcase
    def initialize(brand, color, name)
        @brand = brand.downcase
        @color = color.downcase
        @name = name.downcase
        @@all << self
    end

    #checks if bottle exists, if so, return existing bottle, if not, makes new bottle
    #and returns that. THIS IS THE ONLY METHOD YOU SHOULD USE TO MAKE A NEW BOTTLE
    def self.add_bottle(brand, color, name)
        bottle_that_exists = @@all.find{|bottle|
            bottle.name == name.downcase && bottle.color == color.downcase && bottle.brand == brand.downcase 
        }
        if bottle_that_exists
            return bottle_that_exists
        else
            Bottle.new(brand, color, name)
        end
    end

    #all cellars an instance of a bottle belongs to
    def cellars
        Stash.all_hash_bottle_key[self]
    end

    #all users that have reviewed an instance of a bottle
    def users_reviewed
        Review.all_hash_bottle_key[self].map{|review|
            review.user
        }
    end

    #returns all Bottles ever made
    def self.all
        @@all
    end
end