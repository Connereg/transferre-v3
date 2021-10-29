# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#puts "🌱 Seeding Users..."
#50.times do
   # User.create(username: Faker::Name.name, password: "test")
#end

puts "🌱 Seeding Transactions..."
categories = ["utilities", "groceries", "medicine", "dinner", "movie", "disaster"]

50.times do
    TransferrableTransaction.create(transactor_id: 5, transactee_id: rand(6..50), cost: Faker::Number.decimal(l_digits: 2), category: categories.sample , transaction_to_user: [true, false].sample )
end

50.times do
    TransferrableTransaction.create(transactor_id: rand(6..50), transactee_id: 5, cost: Faker::Number.decimal(l_digits: 2), category: categories.sample , transaction_to_user: [true, false].sample )
end

puts "🌱 Seeding Expenses..."

200.times do
    UserExpense.create(user_id: 5, cost: Faker::Number.decimal(l_digits: 2), category: categories.sample)
end