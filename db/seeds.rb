# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.destroy_all
Market.destroy_all
User.destroy_all
FarmerProduct.destroy_all
BuyerPreference.destroy_all


# Create 6 Markets seeds (name, location, img)
# m1 = Market.create(name: "San Pedro Market", location: "Cusco", img_url: "/app/assets/images/markets/san-pedro.jpg")
# m2 = Market.create(name: "San Camilo Market", location: "Arequipa", img_url: "/app/assets/images/markets/san-camilo.jpg")
m3 = Market.create!(name: "Nakasero Market", location: "Kampala", img_url: "markets/nakasero.jpg")
# m4 = Market.create!(name: "Owino Market", location: "Kampala", img_url: "/app/assets/images/markets/owino.jpg")
# m5 = Market.create!(name: "Central Market", location: "Kinshasa", img_url: "/app/assets/images/markets/central.jpg")
# m6 = Market.create!(name: "Mont-Bouet Market", location: "Libreville", img_url: "/app/assets/images/markets/mont-bouet.jpg")

# create! 12 User seeds
# u1 = User.create!(email: "pedro@pedro.com", password: "123456", first_name: "Pedro", last_name: "Sanchez", location: "Cusco", img_url: "/app/assets/images/users/pedro.jpg")
# u2 = User.create!(email: "ana@ana.com", password: "123456", first_name: "Ana", last_name: "Cavaho", location: "Cusco", img_url: "/app/assets/images/users/ana.jpg")
# u3 = User.create!(email: "carla@carla.com", password: "123456", first_name: "Carla", last_name: "Marin", location: "Cusco", img_url: "/app/assets/images/users/carla.jpg")
john = User.create!(email: "john@john.com", password: "123456", first_name: "John", last_name: "Moriwi", location: "Kampala", img_url: "users/john.jpg", role: "buyer")
stella = User.create!(email: "stella@stella.com", password: "123456", first_name: "Stella", last_name: "Bravo", location: "Kampala", img_url: "users/stella.jpg", role: "buyer")
godin = User.create!(email: "godin@godin.com", password: "123456", first_name: "Godin", last_name: "Maputo", location: "Kampala", img_url: "users/godin.jpg", role: "buyer")
innocent = User.create!(email: "innocent@innocent.com", password: "123456", first_name: "Innocent", last_name: "Obiri", location: "Kampala", img_url: "users/innocent.jpg", role: "buyer")

jessica = User.create!(email: "jessica@jessica.com", password: "123456", first_name: "Jessica", last_name: "Ariwa", location: "Kampala", img_url: "users/jessica.jpg", role: "farmer")
frank = User.create!(email: "frank@frank.com", password: "123456", first_name: "Frank", last_name: "Mumba", location: "Kampala", img_url: "users/frank.jpg", role: "farmer")




# u10 = User.create!(email: "richard@richard.com", password: "123456", first_name: "Richard", last_name: "Mollo", location: "Libreville", img_url: "/app/assets/images/users/richard.jpg")
# u11 = User.create!(email: "cori@cori.com", password: "123456", first_name: "Cori", last_name: "Cando", location: "Libreville", img_url: "/app/assets/images/users/cori.jpg")
# u12 = User.create!(email: "bruna@bruna.com", password: "123456", first_name: "Bruna", last_name: "Ka", location: "Libreville", img_url: "/app/assets/images/users/bruna.jpg")

# create! 12 Products seeds

banana = Product.create!(name: "banana", market: m3, img_url: "products/banana.png")
cabbage = Product.create!(name: "cabbage", market: m3, img_url: "products/cabbage.png")
carrot = Product.create!(name: "carrot", market: m3, img_url: "products/carrot.png")
eggplant = Product.create!(name: "eggplant", market: m3, img_url: "products/eggplant.png")
garlic = Product.create!(name: "garlic", market: m3, img_url: "products/garlic.png")
lettuce = Product.create!(name: "lettuce", market: m3, img_url: "products/lettuce.png")
mango = Product.create!(name: "mango", market: m3, img_url: "products/mango.png")
potato = Product.create!(name: "potato", market: m3, img_url: "products/potato.png")
watermelon = Product.create!(name: "watermelon", market: m3, img_url: "products/watermelon.png")
zucchini = Product.create!(name: "zucchini", market: m3, img_url: "products/zucchini.png")
date = Product.create!(name: "date", market: m3, img_url: "products/date.png")
pineapple = Product.create!(name: "pineapple", market: m3, img_url: "products/pineapple.png")


# create farmer products
fp_jessica_1 = FarmerProduct.create!(user: jessica, product: potato)
fp_jessica_2 = FarmerProduct.create!(user: jessica, product: cabbage)
fp_jessica_3 = FarmerProduct.create!(user: jessica, product: carrot)

fp_barack_1 = FarmerProduct.create!(user: barack, product: eggplant)
fp_barack_2 = FarmerProduct.create!(user: barack, product: cabbage)
fp_barack_3 = FarmerProduct.create!(user: barack, product: lettuce)
fp_barack_4 = FarmerProduct.create!(user: barack, product: mango)
fp_barack_5 = FarmerProduct.create!(user: barack, product: watermelon)


# create buyer preference
bp_john_1 = BuyerPreference.create!(user: john, product: banana, price: 2.5)
bp_john_2 = BuyerPreference.create!(user: john, product: cabbage, price: 3)
bp_john_3 = BuyerPreference.create!(user: john, product: carrot, price: 1.5)
bp_john_4 = BuyerPreference.create!(user: john, product: eggplant, price: 2)
bp_john_5 = BuyerPreference.create!(user: john, product: potato, price: 1)

bp_stella_1 = BuyerPreference.create!(user: stella, product: garlic, price: 0.7)
bp_stella_2 = BuyerPreference.create!(user: stella, product: cabbage, price: 2)
bp_stella_3 = BuyerPreference.create!(user: stella, product: lettuce, price: 1.5)
bp_stella_4 = BuyerPreference.create!(user: stella, product: eggplant, price: 2.5)
bp_stella_5 = BuyerPreference.create!(user: stella, product: zucchini, price: 1)

bp_godin_1 = BuyerPreference.create!(user: godin, product: banana, price: 2.3)
bp_godin_2 = BuyerPreference.create!(user: godin, product: mango, price: 3)
bp_godin_3 = BuyerPreference.create!(user: godin, product: watermelon, price: 5)
bp_godin_4 = BuyerPreference.create!(user: godin, product: date, price: 2.5)
bp_godin_5 = BuyerPreference.create!(user: godin, product: pineapple, price: 3.5)

bp_innocent_1 = BuyerPreference.create!(user: innocent, product: banana, price: 2)
bp_innocent_2 = BuyerPreference.create!(user: innocent, product: mango, price: 2.8)
bp_innocent_3 = BuyerPreference.create!(user: innocent, product: eggplant, price: 2.4)
bp_innocent_4 = BuyerPreference.create!(user: innocent, product: zucchini, price: 1.5)
bp_innocent_5 = BuyerPreference.create!(user: innocent, product: carrot, price: 2)
bp_innocent_6 = BuyerPreference.create!(user: innocent, product: lettuce, price: 1)
bp_innocent_7 = BuyerPreference.create!(user: innocent, product: garlic, price: 0.5)

