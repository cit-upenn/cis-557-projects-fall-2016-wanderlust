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
  advice: "Don't forget to take your coat!!!"
},
{
  icon: "chancerain",
  advice: "Don't forget to carry you umbrella!!!"
},
{
  icon: "chancesleet",
  advice: "Its gonna snow!! Wear a puffer!!!"
},
{
  icon: "chancesnow",
  advice: "Its gonna snow!! Wear a puffer!!!"
},
{
  icon: "chancetstorms",
  advice: "Cover yourself, storm is coming!!!"
},
{
  icon: "clear",
  advice: "Weather is clear today!!! Wear whatever you want"
},
{
  icon: "cloudy",
  advice: "Its gonna be windy!!!, don't forget to take your wind sheeter"
},
{
  icon: "flurries",
  advice: "Wear winter boots, flurries are coming!!! "
},
{
  icon: "fog",
  advice: "Its gonna be chilly outside, cover yourself!!!"
},
{
  icon: "hazy",
  advice: "Wear a mask, drive carefully!!!"
},
{
  icon: "mostlycloudy",
  advice: "Its gonna be cloudy!!!, don't forget to take your wind sheeter"
},
{
  icon: "mostlysunny",
  advice: "Wear shorts, its gonna be hot !!! "
},
{
  icon: "partlycloudy",
  advice: "Its gonna be warm outside!!!, wear shorts if you like"
},
{
  icon: "partlysunny",
  advice: "Wear shorts, its gonna be hot !!! "
},
{
  icon: "sleet",
  advice: "Its gonna be freexing cold!!!, wear layers"
},
{
  icon: "rain",
  advice: "Leave early, its gonna rain cats and dogs!!!. Don't forget rain coat."
},
{
  icon: "snow",
  advice: "Please a good winter coat to wear, its freezing!!!"
},
{
  icon: "sunny",
  advice: "Its gonna be freeking cold!!!, wear layers"
},
{
  icon: "tstorms",
  advice: "Carefull !! Wear rain coat !!!"
},
{
  icon: "unknown",
  advice: "Weather is a breeze today!!!. Wear anyting you like"
}])

p "Created #{Weather.count} weathers"