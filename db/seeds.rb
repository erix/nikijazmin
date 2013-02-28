# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
require "yaml";

products = YAML::load(File.open(File.dirname(__FILE__) + '/products.yml'))
products.each do |p|
  print "Processing '#{p["name"]}': "
  new_product = Product.find_by_name(p["name"])
  if new_product.nil?
    puts "New"
    new_product = Product.create(p)
  else
    puts "Update"
    new_product.update_attributes(p)
  end
end

# Create the admin user
if User.find_by_name('admin').nil?
  puts "Creating the admin user"
  User.create(name: 'admin', password: 'admin')
end
