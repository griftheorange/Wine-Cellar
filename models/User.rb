class User
    attr_reader :name, :username
    @@all = []

    def initialize(name, username)
        @name = name
        @username = username
        @@all << self
    end

    def cellars
        Cellar.all_hash_user_key[self]
    end

    def reviews
        Review.all_hash_user_key[self]
    end

    #Dont want to use in user, but proof of concept, Bottle.add_bottle handles the search method
    # def add_bottle_by_brand_color_name(brand, color, name)
    #     Bottle.add_bottle(brand, color, name)
    # end

    def add_bottle_to_cellar(cellar, bottle)
        cellar.add_bottle(bottle)
    end

    def all_bottles_in_cellars
        cellars.map{|cellar|
            cellar.bottles
    }.flatten
    end

    def find_cellar_by_name(name)
        cellars.find{|cellar|
            cellar.name == name
        }
    end

    def review_wine(bottle)
        Review.new(self, bottle)
    end

    def open_new_cellar(name)
        Cellar.new(self, name)
    end

    def self.all
        @@all
    end

    
end