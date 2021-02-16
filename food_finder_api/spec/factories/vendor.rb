require 'faker'

FactoryBot.define do
  factory :vendor do
    location_id { Faker::Number.number(digits: 10) }
    name { Faker::Restaurant.name }
    facility_type { [Vendor::TRUCK, Vendor::CART].sample }
    location_description { Faker::Restaurant.type }
    address { Faker::Address.street_address + " San Francisco" }
    permit_status { Vendor::ACTIVE }
    food_description {
      [
        "Burgers: melts: hot dogs: burritos:sandwiches: fries: onion rings: drinks",
        "Cold Truck: packaged sandwiches: snacks: candy: hot and cold drinks",
        "Hot dogs: condiments: soft pretzels: soft drinks: coffee: cold beverages: pastries: bakery goods: cookies: ice cream: candy: soups: churros: chestnuts: nuts: fresh fruit: fruit juices: desserts: potato chips and popcorn.",
        "Rotisserie Chicken; Ribs; Pork Loin; Roasted Potatoes; Chicken Wrap; Kale Salad; Drinks",
        "Kettle Corn: Funnel Cakes: Waffles: Lemonade",
        "Hot coffee: iced coffee: hot chocolate: tea: pastries",
        "Tacos: Burritos: Quesadillas: Tortas: Nachos: Hot Dogs:Soda: Water: Fruit Drinks"
      ].sample
    }
    latitude { Faker::Address.latitude.to_f }
    longitude { Faker::Address.longitude.to_f }
    days_hours {
      [
        "Mo-Su:10AM-6PM",
        "Mo-Fr:11AM-2PM",
        "We/Th/Fr:8AM-3PM",
        "Sa-Su:6AM-8PM"
      ]
    }
  end
end