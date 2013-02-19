# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
require "yaml";

puts __FILE__
products = YAML::load(File.open(File.dirname(__FILE__) + '/products.yml'))
products.each do |p|
  new_product = Product.find_or_create_by_name(p)
  new_product.update_attributes(p)
end
