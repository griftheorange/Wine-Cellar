class Stash
attr_reader :cellar, :bottle
@@all = []
@@all_hash_cellar_key = {}
@@all_hash_bottle_key = {}

#Initializes with cellar and bottle pointers
#adds seld to all array and adds self to cellar and bottle keys
#in appropriate hashes
def initialize(cellar, bottle)
    @cellar = cellar
    @bottle = bottle
    self.add_to_cellar_key(cellar)
    self.add_to_bottle_key(bottle)
    @@all << self
end

#Facilitates initialization
def add_to_cellar_key(cellar)
    if Stash.all_hash_cellar_key[cellar]
        Stash.all_hash_cellar_key[cellar] << self
    else
        Stash.all_hash_cellar_key[cellar] = [self]
    end
end

#Facilitates initialization
def add_to_bottle_key(bottle)
    if Stash.all_hash_bottle_key[bottle]
        Stash.all_hash_bottle_key[bottle] << self
    else
        Stash.all_hash_bottle_key[bottle] = [self]
    end
end

#returns all Stash objects as array
def self.all
    @@all
end

#returns cellar key hash
def self.all_hash_cellar_key
    @@all_hash_cellar_key
end

#returns bottle key hash
def self.all_hash_bottle_key
    @@all_hash_bottle_key
end

end