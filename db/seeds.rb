require 'faker'

puts 'Gerando users...'

10.times do |i|
  User.create(
    email: ["user@user.com", "admin@admin.com"].sample, 
    password: Faker::Alphanumeric.alphanumeric(number: 10)     
    )
end

puts 'Users gerados com sucesso!'
