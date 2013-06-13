# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Using the .delete_all method on a given model deletes any existing records; note that it may be better to run 
    # $ rake db:drop
# followed by
    # $ rake db:migrate
# before running
    # $ rake db:seed
# to seed your data.

Page.delete_all

# Rails is smart enough to create individual records from an array of hashes.
# This seed data will create a Welcome and About page. Note the %{ } shorthand
# syntax for longer strings.

pages = Page.create([
  { title: 'Welcome', content: %{ This is the home page. } },
  { title: 'About', content: %{ This is the about page. } }
  ])

# Sample stores below

store = Store.create({title: 'Planetarium', description: %{The Adler Planetarium & Astronomy Museum in Chicago, Illinois was the first planetarium built in the Western Hemisphere and is the oldest in existence today. Adler was founded and built in 1930 by the philanthropist Max Adler, with the assistance of the first director of the planetarium, Philip Fox. The Adler Planetarium opened to the public on May 12, 1930.}, address: '2201 Museum campus, Chicago, IL 60616', image_url: 'saucony.png'})

store = Store.create({title: 'Field Museum', description: %{The Adler Planetarium & Astronomy Museum in Chicago, Illinois was the first planetarium built in the Western Hemisphere and is the oldest in existence today. Adler was founded and built in 1930 by the philanthropist Max Adler, with the assistance of the first director of the planetarium, Philip Fox. The Adler Planetarium opened to the public on May 12, 1930.}, address: '2201 Museum campus, Chicago, IL 60616', image_url: 'saucony.png'})

store = Store.create({title: 'Shedd Aquarium', description: %{The Adler Planetarium & Astronomy Museum in Chicago, Illinois was the first planetarium built in the Western Hemisphere and is the oldest in existence today. Adler was founded and built in 1930 by the philanthropist Max Adler, with the assistance of the first director of the planetarium, Philip Fox. The Adler Planetarium opened to the public on May 12, 1930.}, address: '2201 Museum campus, Chicago, IL 60616', image_url: 'saucony.png'})

#Seed data for products below

Product.delete_all

Product.create(title: 'Saucony',
  description: 
    %{
        CoffeeScript is JavaScript done right. It provides all of JavaScript's
	functionality wrapped in a cleaner, more succinct syntax. In the first
	book on this exciting new language, CoffeeScript guru Trevor Burnham
	shows you how to hold onto all the power and flexibility of JavaScript
	while writing clearer, cleaner, and safer code.
      },
  image_url:   'saucony.png',    
  price: 36.00)
# . . .
Product.create(title: 'Nike',
  description:
    %{
        Ruby is the fastest growing and most exciting dynamic language
        out there. If you need to get working programs delivered fast,
        you should add Ruby to your toolbox.
      },
  image_url: 'saucony.png',
  price: 49.95)
# . . .
