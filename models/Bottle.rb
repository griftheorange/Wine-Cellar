class Bottle
    attr_reader :brand, :color, :name
    @@all = []



    def initialize(brand, color, name)
            @brand = brand
            @color = color
            @name = name
            @@all << self
        end
    end

    def add_bottle(brand, color, name)
        bottle_that_exists = @@all.find{|bottle|
            bottle.name.downcase == name.downcase && bottle.color.downcase == color.downcase && bottle.brand.downcase == brand.downcase 
        }
        if bottle_exists
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