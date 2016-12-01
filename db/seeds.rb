# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

create_user = for i in 1..10 do
  User.create!([email: "#{i}@#{i}.com",password: "111111",password_confirmation: "111111",is_admin: true,
                gender: "美女", nameNick: "神圣小可爱#{i}", nameChi: "XX#{i}", birthday: "2000.1.1#{i}", cellNum: "110#{i}",
                heightUser: "188", income: "11",
                image: "http://img0.hao123.com/data/1_8ad30e464ae5dcdfe4b57570deef4fd4_510.#{i}"])
end
puts "10 User created."

Restaurant.create!([name: "二师兄最爱的汉堡王", description: "开发大道799号万达广场2号门", cellnum: "0576-88802257"])
puts "餐馆创建成功"

# create_post = for i in 1..10 do
#   Post.create!([title: "约饭主题no.#{i}", description: "约饭详细信息#{i}", user_id: i, post.restaurant.name: "hahah#{i}", image:"https://ooo.0o0.ooo/2016/11/16/582c6e89c1c45.jpeg.#{i}"])
# end
# puts "10 posts created."
#
# create_post_restaurant = for i in 1..10 do
#   PostRestaurant.create!([post_id: "#{i}", restaurant_id: "1" ])
