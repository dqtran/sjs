namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin=User.create!(name: "Haojie Hang",
                 email: "haojie.hang@colorado.edu",
                 password: "hungry1526",
                 password_confirmation: "hungry1526")
    admin.toggle!(:admin)
    49.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@colorado.edu"
      password = "passw0rd"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    users=User.all(limit: 5)
    10.times do
      desc = Faker::Lorem.paragraph(3)
      titl = "Generated Title"
      ctgy = "Generated Category"
      users.each{ |user| user.projects.create!(description: desc, title: titl, category: ctgy)}
    end

    3.times do
      comment=Faker::Internet.email
      users.each{ |user| user.comments.create!(body: comment)}
    end
  end
end
