# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

sub_category_mappings = {
  "Personal": %w[Loan Saving Salary Gift Lend EMIs Donation Investment Insurance Others Miscellaneous],
  "Entertainment": %w[Movies, Dish\ Recharge Subscriptions Party\ &\ Fun, Vacations Miscellaneous],
  "Shopping": %w[Grocery Fruits Vegetables Milk Cloths Books Electronics Gold Miscellaneous],
  "Utilities": %w[Electricity Gas Internet Phone Water Maintenance Car Cleaning Servicing Miscellaneous],
  "Traveling": %w[Toll\ Taxes Petrol Diesel Miscellaneous],
  "Schooling": %w[School\ and\ Bus\ Fee Clothing Books Stationary Trips Tuition\ Fee Miscellaneous],
}

%w[Personal Entertainment Shopping Utilities Traveling Schooling].each do |category|
  c = Category.create(name: category)
  sub_category_mappings[category.to_sym].each do |sub_category|
    SubCategory.create(name: sub_category, category: c)
  end
end
