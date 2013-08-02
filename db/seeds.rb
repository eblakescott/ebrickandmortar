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

store = Store.create({title: 'Golden Legs Running', description: %{Golden Legs Running is the ONLY specialty running retail store in Lake County, IL that is owned and operated by Lake County residents. It was created in 2006 to support and grow the running, cycling, and fitness community in Lake County, IL. Now, GLR offers the greatest running shoes, apparel, and accessories for athletes of all abilities. At GLR you'll have access to everything you need to reach your fitness goals - from an expert gait analysis and shoe-fitting by a member of our staff to a training program tailored to successfully get you to the finish-line injury free. Stop by GLR to learn more!}, address: '508 N. Seymour Ave. Mundelein, IL 60060', image_url: 'gl_logo.png'})
shoes = store.shoes.create({title: 'Saucony', description:  %{These shoes will blow your competitors away!}, image_url: 'saucony.png', price: 87.00, sex: 'm', color: 'blue', size: '10', width: 'D'})
  
store = Store.create({title: 'Field Museum', description: %{The Adler Planetarium & Astronomy Museum in Chicago, Illinois was the first planetarium built in the Western Hemisphere and is the oldest in existence today. Adler was founded and built in 1930 by the philanthropist Max Adler, with the assistance of the first director of the planetarium, Philip Fox. The Adler Planetarium opened to the public on May 12, 1930.}, address: '2201 Museum campus, Chicago, IL 60616', image_url: 'saucony.png'})

store = Store.create({title: 'Shedd Aquarium', description: %{The Adler Planetarium & Astronomy Museum in Chicago, Illinois was the first planetarium built in the Western Hemisphere and is the oldest in existence today. Adler was founded and built in 1930 by the philanthropist Max Adler, with the assistance of the first director of the planetarium, Philip Fox. The Adler Planetarium opened to the public on May 12, 1930.}, address: '2201 Museum campus, Chicago, IL 60616', image_url: 'saucony.png'})

#Create an admin account
Admin.new({ :email => 'ed@ed.com', :password => 'Edward', :password_confirmation => 'Edward'}).save

#Create a store admin account to edit specific stores
Store_admin.new({ :email => 'mark@mark.com', :password => 'Mark', :password_confirmation => 'Mark'}).save
