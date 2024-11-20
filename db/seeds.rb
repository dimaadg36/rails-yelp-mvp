puts "Cleaning database..."
Review.destroy_all
Restaurant.destroy_all

puts "Creating restaurants..."
restaurants = [
  {
    name: "Sushi Zen",
    address: "123 Tokyo Lane, Japan Town",
    phone_number: "555-1234",
    category: "japanese"
  },
  {
    name: "Pasta Paradise",
    address: "456 Rome Ave, Italian District",
    phone_number: "555-5678",
    category: "italian"
  },
  {
    name: "Le Gourmet",
    address: "789 Paris St, French Quarter",
    phone_number: "555-9101",
    category: "french"
  },
  {
    name: "Golden Dragon",
    address: "321 Beijing Rd, Chinatown",
    phone_number: "555-1122",
    category: "chinese"
  },
  {
    name: "Burger Bliss",
    address: "654 Main St, Downtown",
    phone_number: "555-3344",
    category: "american"
  }
]

restaurants.each do |restaurant_data|
  restaurant = Restaurant.create!(restaurant_data)
  puts "Created #{restaurant.name}"

  # Adding random reviews for each restaurant
  rand(1..5).times do
    review = Review.create!(
      rating: rand(1..5),
      content: "Sample review for #{restaurant.name}.",
      restaurant: restaurant
    )
    puts "  Added review: #{review.content} (Rating: #{review.rating})"
  end
end

puts "Seeding completed!"
