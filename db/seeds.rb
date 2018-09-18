# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Create products'

COLORS = {
  blue: {
    title: {
      ru: 'синий',
      en: 'blue'
    },
    description: {
      ru: 'Это синий цвет',
      en: 'This is blue'
    }
  },
  dark: {
    title: {
      ru: 'черный',
      en: 'dark'
    },
    description: {
      ru: 'Это черный цвет',
      en: 'This is dark'
    }
  },
  green: {
    title: {
      ru: 'зеленый',
      en: 'green'
    },
    description: {
      ru: 'Это зеленый цвет',
      en: 'This is green'
    }
  },
  red: {
    title: {
      ru: 'красный',
      en: 'red'
    },
    description: {
      ru: 'Это красный цвет',
      en: 'This is red'
    }
  },
  yellow: {
    title: {
      ru: 'желтый',
      en: 'yellow'
    },
    description: {
      ru: 'Это желтый цвет',
      en: 'This is yellow'
    }
  }
}

COLORS.keys.each do |color|
  puts color

  preview_path = Rails.root.join('public', 'colors', "#{color}", 'preview.png')
  preview_file = File.open(preview_path)

  product = Product.new(
    preview: preview_file,
    price_cents: rand(1000..10000),
    price_currency: %w(RUB USD EUR).sample
  )

  color_hash = COLORS[color]

  color_hash[:title].each do |lang, value|
    product["title_#{lang}"] = value.capitalize
  end

  color_hash[:description].each do |lang, value|
    product["description_#{lang}"] = value
  end

  product.save

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
