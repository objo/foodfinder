# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Creating vendors"
puts "********************************"

puts "\tDestroying existing vendors"

Vendor.destroy_all

require 'csv'

puts "\tReading in CSV file"
vendors = CSV.parse(File.read("db/Mobile_Food_Facility_Permit.csv"), headers: true)

puts "\tCreating vendors\n"
vendors.each do |vendor|
  putc "."
  Vendor.from_csv(vendor)
end
puts "\n\tCreated #{Vendor.count} vendors"
puts "\tdone"