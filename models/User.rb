class User

    @@all = []

    attr_accessor :username, :cellar

    def initialize(username)
        @username = username
        @cellar = Cellar.new
        @cellar.user = self
        @@all << self
    end

    def self.all
        @@all
    end
end