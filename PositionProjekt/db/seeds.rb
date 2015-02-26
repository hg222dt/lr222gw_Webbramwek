# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
user = User.create(email:"test@test.se",password:"123")
user.save
user2 = User.create(email:"tester2@test.se",password:"123")
user2.save
user3 = User.create(email:"testare3@test.se",password:"123")
user3.save
user4 = User.create(email:"megatester4@test.se",password:"123")
user4.save

App.delete_all
app = App.create(name:"testers App")
app.user = user
app.save
app2 = App.create(name:"CoolAppio")
app2.user = user
app2.save
app3 = App.create(name:"SuperChicken App")
app3.user = user2
app3.save
app4 = App.create(name:"Duckhunter App")
app4.user = user3
app4.save

Position.delete_all
pos = Position.create(lat:"321.12332", lng:"31.3214", name:"testPosition Kronan")
pos.save
pos2 = Position.create(lat:"564.12332", lng:"432.3214", name:"testPosition2 Lövet")
pos2.save
pos3 = Position.create(lat:"12.12332", lng:"615.3214", name:"testPosition3 Flaskan")
pos3.save
pos4 = Position.create(lat:"645.12332", lng:"54.3214", name:"testPosition4 Skivan")
pos4.save

Event.delete_all
event = Event.create(name:"Kronans Event", eventDate:"12/12/2012", desc:"En krona som har ett event, eller något")
event.user = user
event.position = pos
event.save
event2 = Event.create(name:"Disco", eventDate:"11/11/2011", desc:"ett löv som har något trevligt för sig, ett disco kanske")
event2.user = user
event2.position = pos2
event2.save
event3 = Event.create(name:"Uppror", eventDate:"10/11/2015", desc:"Uppror på en skiva")
event3.user = user3
event3.position = pos4
event3.save


Tag.delete_all
tag = Tag.create(name:"krona")
tag.save
tag2 = Tag.create(name:"löv")
tag2.save
tag3 = Tag.create(name:"Flaska")
tag3.save
tag4 = Tag.create(name:"Skiva")
tag4.save

TagOnEvent.delete_all
toe = TagOnEvent.new
toe.event = event
toe.tag = tag
toe.save

toe2 = TagOnEvent.new
toe2.event = event2
toe2.tag = tag2
toe2.save

toe3 = TagOnEvent.new
toe3.event = event3
toe3.tag = tag4
toe3.save








