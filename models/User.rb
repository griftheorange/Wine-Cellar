class User

    @@all = []

    attr_accessor :cellar

    def initialize
        cellar = Cellar.new
        @@all << self
    end
end