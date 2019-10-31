class Cellar

    @@all = []

    attr_accessor :bottles

    def initialize
        @bottles = []
        @@all << self
    end

    def add_to_cellar(bottle)
        @bottles << bottle
    end

    def self.all
        @@all
    end


end