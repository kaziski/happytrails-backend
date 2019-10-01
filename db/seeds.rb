# Examples:
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#User
# kazumi = User.create(name: "Kazumi", username: "Codingmamakaz", password: "password")
# john = User.create(name: "John", username: "Cookingpapajohn", password: "password")
# jiji = User.create(name: "Jion", username: "Jiji", password: "password")
# keima = User.create(name: "Keima", username: "Keima", password: "password")
kazumi = User.create(username: "Codingmamakaz", password: "password")
john = User.create(username: "Cookingpapajohn", password: "password")
jiji = User.create(username: "Jiji", password: "password")
keima = User.create(username: "Keima", password: "password")

#Trail
trail_list = [
  ['Scrubglass', 2.4, 1],
  ['Peters Lake', 2, 2],
  ['Frankfort Mineral Springs', 1.2, 3],
  ['Ohio community park', 0.8, 1]
]

trail_list.each do |trail|
  Trail.create(name: trail[0], length: trail[1], user_id: trail[2])
end

#Review
review_list = [
  ['Very beautiful! Easy walking', 2, 1],
  ['The trail near the creek is shady. Perfect for summer hikes', 1, 2],
  ['The fall is beautiful especially after rain', 3, 4],
  ['Easy paved path.', 4, 3],
  ['Perfect for practicing riding bikes', 4, 1],
  ['My kids love playing here.', 3, 2]
]

review_list.each do |review|
  Review.create(comment: review[0], trail_id: review[1], user_id: review[2])
end