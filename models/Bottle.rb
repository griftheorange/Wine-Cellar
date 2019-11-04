class Bottle
    attr_reader :brand, :color, :name
    @@all = []

    def initialize(brand, color, name)
        @brand = brand.downcase
        @color = color.downcase
        @name = name.downcase
        @@all << self
    end

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

    def cellars
        Stash.all_hash_bottle_key[self]
    end

    def users_reviewed
        Review.all_hash_bottle_key[self].map{|review|
            review.user
        }
    end

    def self.all
        @@all
    end
end