class Bottle
    attr_reader :brand, :color, :name
    @@all = []

    def initialize(brand, color, name)
        @brand = brand
        @color = color
        @name = name
        @@all << self
    end

    def cellars
        Stash.all_hash_bottle_key[self]
    end

    def users_reviewed
        Review.all_hash_bottle_key[self]
    end

    def self.all
        @@all
    end
end