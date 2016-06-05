# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

dean = User.create(first_name: "Dean", last_name: "Watts", username: "hdwatts", email: "dean@tales.com", password: "password1" )
alex = User.create(first_name: "Alex", last_name: "Martin", username: "asmartin", email: "alex@tales.com", password: "password1" )
eve = User.create(first_name: "Eve", last_name: "Essex", username: "eessex", email: "eve@tales.com", password: "password1" )


until User.all.count == 8 do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  username = Faker::Internet.user_name
  email = first_name.downcase + "@flatironschool.com"
  password = Faker::Internet.password(6)
  u = User.create(first_name: first_name, username: username, last_name: last_name, email: email, password: password)
  puts "#{User.all.count} #{first_name} #{last_name} #{username} #{email} #{password} #{u.valid?}"
  if u.valid?
    [rand(6).years, rand(365).days, rand(24).hours, rand(60).minutes, rand(60).seconds].each{|time| u.created_at -= time}
    u.save
  end
end

5.times do
  user = User.all.sample
  t = Tale.create(prompt: Faker::Hipster.paragraph(rand(3)), owner: user)
  t.save!
  content = Faker::Hipster.paragraph until content && content.length <= 250
  first_line = Line.create(user: user, tale: t, content: content)
end

Tale.all.each do |tale|
  rand(1..5).times do
    user = User.all.sample until user && user != tale.lines.last.user
    content = Faker::Hipster.paragraph until content && content.length <= 250
    Line.create(user: user, tale: tale, content: content)
  end
end

10.times do
  tag = Tag.create(name: Faker::Hipster.word)
  (rand(1..Tale.all.size)).times do
    tale = Tale.all.sample until tale && !tag.tales.include?(tale)
    TagsTale.create(tag: tag, tale: tale )
    tale.save
  end
end