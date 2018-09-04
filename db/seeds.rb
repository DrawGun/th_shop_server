# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Create products'

COLORS = {
  blue: 'This is blue',
  dark: 'This is dark',
  green: 'This is green',
  red: 'This is red',
  yellow: 'This is yellow'
}

COLORS.keys.each do |color|
  puts color

  preview_path = Rails.root.join('public', 'colors', "#{color}", 'preview.png')
  preview_file = File.open(preview_path)

  product = Product.create!(
    title: color.capitalize,
    description: COLORS[color].capitalize,
    preview: preview_file,
    price_cents: rand(1000..10000),
    price_currency: %w(RUB USD EUR).sample
  )

  5.times do |time|
    filename = "#{time + 1}.png"
    puts filename
    color_path = Rails.root.join('public', 'colors', "#{color}", filename)
    color_file = File.open(color_path)
    favorite = time == 0

    Image.create!(
      image: color_file,
      product: product,
      alt: filename,
      favorite: favorite
    )
  end
end
