# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all

luffy = User.create!(email: 'luffy@strawhats.com', first_name: 'Luffy', last_name: 'MonkeyD', password:'starwars', birth_date: Faker::Date.between(30.years.ago, Date.today), gender: 'M')
luffy.avatar = File.open("#{Rails.root}/app/assets/images/Monkey_D_Luffy.jpg")
luffy.save!
luffy.cover_photo = File.open("#{Rails.root}/app/assets/images/LuffyCover.jpg")
luffy.save!

nami = User.create!(email: 'nami@strawhats.com', first_name: 'Nami', last_name: 'CatBurglar', password:'starwars', birth_date: Faker::Date.between(30.years.ago, Date.today), gender: 'F')
nami.avatar = File.open("#{Rails.root}/app/assets/images/Nami.jpg")
nami.save!
nami.cover_photo = File.open("#{Rails.root}/app/assets/images/NamiCover.jpg")
nami.save!

usopp = User.create!(email: 'usopp@strawhats.com', first_name: 'Usopp', last_name: 'Sogeking', password:'starwars', birth_date: Faker::Date.between(30.years.ago, Date.today), gender: 'M')
usopp.avatar = File.open("#{Rails.root}/app/assets/images/Usopp.jpg")
usopp.save!
usopp.cover_photo = File.open("#{Rails.root}/app/assets/images/UsoppCover.jpg")
usopp.save!

sanji = User.create!(email: 'sanji@strawhats.com', first_name: 'Sanji', last_name: 'Vinsmoke', password:'starwars', birth_date: Faker::Date.between(30.years.ago, Date.today), gender: 'M')
sanji.avatar = File.open("#{Rails.root}/app/assets/images/Sanji.jpg")
sanji.save!
sanji.cover_photo = File.open("#{Rails.root}/app/assets/images/SanjiCover.jpg")
sanji.save!

zoro = User.create!(email: 'zoro@strawhats.com', first_name: 'Zoro', last_name: 'Roronoa', password:'starwars', birth_date: Faker::Date.between(30.years.ago, Date.today), gender: 'M')
zoro.avatar = File.open("#{Rails.root}/app/assets/images/Zoro.jpg")
zoro.save!
zoro.cover_photo = File.open("#{Rails.root}/app/assets/images/ZoroCover.jpg")
zoro.save!

chopper = User.create!(email: 'chopper@strawhats.com', first_name: 'Chopper', last_name: 'TonyTony', password:'starwars', birth_date: Faker::Date.between(20.years.ago, Date.today), gender: 'M')
chopper.avatar = File.open("#{Rails.root}/app/assets/images/Chopper.jpg")
chopper.save!
chopper.cover_photo = File.open("#{Rails.root}/app/assets/images/ChopperCover.jpg")
chopper.save!

franky = User.create!(email: 'franky@strawhats.com', first_name: 'Franky', last_name: 'Ironman', password:'starwars', birth_date: Faker::Date.between(40.years.ago, Date.today), gender: 'M')
franky.avatar = File.open("#{Rails.root}/app/assets/images/Franky.jpg")
franky.save!
franky.cover_photo = File.open("#{Rails.root}/app/assets/images/FrankyCover.jpg")
franky.save!

robin = User.create!(email: 'robin@strawhats.com', first_name: 'Robin', last_name: 'Nico', password:'starwars', birth_date: Faker::Date.between(40.years.ago, Date.today), gender: 'F')
robin.avatar = File.open("#{Rails.root}/app/assets/images/Robin.jpg")
robin.save!
robin.cover_photo = File.open("#{Rails.root}/app/assets/images/RobinCover.jpg")
robin.save!

brook = User.new(email: 'brook@strawhats.com', first_name: 'Brook', last_name: 'SoulKing', password:'starwars', birth_date: Faker::Date.between(50.years.ago, Date.today), gender: 'M')
brook.avatar = File.open("#{Rails.root}/app/assets/images/Brook.jpg")
brook.save!
brook.cover_photo = File.open("#{Rails.root}/app/assets/images/BrookCover.jpg")
brook.save!

#--------------------------------------------------------------------------------------------------------------------------#

users = User.all

Post.destroy_all

8.times do
  Post.create!(author_id: users.all.sample.id, receiver_id: users.all.sample.id, body: Faker::OnePiece.quote)
  Post.create!(author_id: users.all.sample.id, receiver_id: users.all.sample.id, body: Faker::OnePiece.quote)
  Post.create!(author_id: users.all.sample.id, receiver_id: users.all.sample.id, body: Faker::OnePiece.quote)
  Post.create!(author_id: users.all.sample.id, receiver_id: users.all.sample.id, body: Faker::OnePiece.quote)
  Post.create!(author_id: users.all.sample.id, receiver_id: users.all.sample.id, body: Faker::OnePiece.quote)
end
