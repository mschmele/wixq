# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create Shows first
shows = Show.create(
  [
    {
      name: "Timmy Test on Tuesdays",
      start_time: Time.now.beginning_of_hour,
      end_time: Time.now.beginning_of_hour.advance(hours: 2),
      day_of_week: "Tuesday"
    },
    {
      name: "Testing Thursdays",
      start_time: Time.now.beginning_of_hour.advance(hours: 6),
      end_time: Time.now.beginning_of_hour.advance(hours: 8),
      day_of_week: "Thursday"
    },
    {
      name: "Test Hour",
      start_time: Time.now.beginning_of_hour.advance(hours: 1),
      end_time: Time.now.beginning_of_hour.advance(hours: 2),
      day_of_week: "Monday"
    }
  ]
)

# Give each show a DJ
djs = Dj.create(
  [
    {
      first_name: "Timmy",
      last_name: "Test",
      show: shows.first,
      bio: "Timmy test is a real nice guy who likes music and tests."
    },
    {
      first_name: "Tammy",
      last_name: "Testings",
      show: shows[1],
      bio: "Tammy loves Alt-J and failing 100 level science gen eds."
    },
    {
      first_name: "Tristan",
      last_name: "McTest",
      show: shows[2],
      bio: "Tristan likes the radio, which I guess makes a lot of sense."
    }
  ]
)
