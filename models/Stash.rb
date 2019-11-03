class Stash
attr_reader :cellar, :bottle
@@all = []
@@all_hash_cellar_key = {}
@@all_hash_bottle_key = {}

def initialize(cellar, bottle)
    @cellar = cellar
    @bottle = bottle
    self.add_to_cellar_key(cellar)
    self.add_to_bottle_key(bottle)
    @@all << self
end

def add_to_cellar_key(cellar)
    if Stash.all_hash_cellar_key[cellar]
        Stash.all_hash_cellar_key[cellar] << self
    else
        Stash.all_hash_cellar_key[cellar] = [self]
    end
end

def add_to_bottle_key(bottle)
    if Stash.all_hash_bottle_key[bottle]
        Stash.all_hash_bottle_key[bottle] << self
    else
        Stash.all_hash_bottle_key[bottle] = [self]
    end
end

def self.all
    @@all
end

def self.all_hash_cellar_key
    @@all_hash_cellar_key
end

def self.all_hash_bottle_key
    @@all_hash_bottle_key
end

end