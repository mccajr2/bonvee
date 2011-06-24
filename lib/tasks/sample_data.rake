namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:name => "Example User",
                         :email => "example@railstutorial.org",
                         :location => "Boston, MA",
                         :tagline => "My tagline",
                         :password => "foobar",
                         :password_confirmation => "foobar")
    admin.toggle!(:admin)         
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      location = Faker::Address.city
      tagline = "This is an awesome tagline"
      User.create!(:name => name,
                   :email => email,
                   :location => location,
                   :tagline => tagline,
                   :password => password,
                   :password_confirmation => password)
    end
  end
end
