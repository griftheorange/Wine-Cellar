class Cellar

    @@all = []

    attr_accessor :bottles, :user

    def initialize
        @bottles = []
        @@all << self
    end

    def self.all
        @@all
    end


end