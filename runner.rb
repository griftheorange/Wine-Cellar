require_relative './environment.rb'

griffin = User.new('griffin', 'griftheorange') #two users
julia = User.new('julia', 'LaJui')

moscato = Bottle.new('Barefoot', 'White', 'Moscato')
vodka = Bottle.new('Sven\'s', 'Red', 'Vodka')
lemonade = Bottle.new('Mike\'s', 'Yellow', 'Hard Lemonade')
rose = Bottle.new('Jack\'s', 'Pink', 'Rose')

griffin.review_wine(moscato)
griffin.review_wine(vodka)
griffin.review_wine(lemonade)
griffin.review_wine(rose)

julia.review_wine(rose)

party_city = griffin.open_new_cellar('Party City') #
party_city_2 = griffin.open_new_cellar('Party City 2, Electric Boogaloo')
wegmans = julia.open_new_cellar('Wegmans')

party_city.stash_bottle(moscato)
party_city.stash_bottle(vodka)
party_city.stash_bottle(lemonade)
party_city_2.stash_bottle(moscato)
party_city_2.stash_bottle(lemonade)
party_city_2.stash_bottle(rose)

wegmans.stash_bottle(rose)


binding.pry
0