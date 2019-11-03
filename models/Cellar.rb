class Cellar
    attr_reader :user, :name
    @@all = []
    @@all_hash_user_key = {}

    def initialize(user, name)
        @user = user
        @name = name
        @@all << self
        self.add_to_user_key(user)
    end

    def add_bottle(bottle)
        bottle = Stash.new(self, bottle)
    end

    def bottles
        Stash.all_hash_cellar_key[self].map{|stash|
            stash.bottle
        }
    end

    def add_to_user_key(user)
        if Cellar.all_hash_user_key[user]
            Cellar.all_hash_user_key[user] << self
        else
            Cellar.all_hash_user_key[user] = [self]
        end
    end

    def self.all
        @@all
    end

    def self.all_hash_user_key
        @@all_hash_user_key
    end
end