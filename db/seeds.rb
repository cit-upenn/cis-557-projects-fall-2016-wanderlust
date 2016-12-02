# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Weather.destroy_all

Weather.create!([{
  icon: "chanceflurries",
  advice: "Chance of flurries, we suggest you to take your coat and wear something warm."
},
{
  icon: "chancerain",
  advice: "Chances of rain, make sure you have an umbrella."
},
{
  icon: "chancesleet",
  advice: "Chances of snow, make sure you are got yourself covered. Enjoy!"
},
{
  icon: "chancesnow",
  advice: "Chances of snow, make sure you are got yourself covered. Enjoy!"
},
{
  icon: "chancetstorms",
  advice: "There might be storms, carry an umbrella and wear something waterproof."
},
{
  icon: "clear",
  advice: "Sky is clear, no chances of rain. Dress accordingly."
},
{
  icon: "cloudy",
  advice: "Cloudy skies, be prepared for scattered showers today."
},
{
  icon: "flurries",
  advice: "Be prepared for flurries, winter boots will come handy."
},
{
  icon: "fog",
  advice: "Foggy weather today, travel safely."
},
{
  icon: "hazy",
  advice: "Visibility is less, drive safely."
},
{
  icon: "mostlycloudy",
  advice: "Scattered showers expected. Be sure to carry an umbrella."
},
{
  icon: "mostlysunny",
  advice: "Sunny day today. Chances of rain are low."
},
{
  icon: "partlycloudy",
  advice: "Chances of rain, carry an umbrella just in case."
},
{
  icon: "partlysunny",
  advice: "Scattered clouds, but should be fine. Dress accordingly."
},
{
  icon: "sleet",
  advice: "Chilly winds and freezing temperature! Wear lots of layers."
},
{
  icon: "rain",
  advice: "It's raining! It's a pity your travel plans might be ruined. Carry an umbrella."
},
{
  icon: "snow",
  advice: "Expect snow. Carry all the required equipments with you."
},
{
  icon: "sunny",
  advice: "Sunny day today. Good time to get those summer clothers on."
},
{
  icon: "tstorms",
  advice: "Be prepared for storms and scattered showers."
},
{
  icon: "unknown",
  advice: "Honestly, even we don't know how it will pan out today. The temperature can guide you to dress accordingly."
}])

p "Created #{Weather.count} weathers"